import 'package:flutter/cupertino.dart';

class MykeChatPage extends StatelessWidget {
  const MykeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> messages = [
      {"text": "Good morning sir, San po ung Room?", "type": "received"},
      {"text": "Sa Drawing Room tayo..", "type": "sent"},
      {"text": "Anong oras po?", "type": "received"},
      {"text": "1 pm. Kain muna kayo.", "type": "sent"},
      {"text": "Checking tayo ng Activity mamaya.", "type": "sent"},
      {"text": "Thanksss sir!", "type": "received"},
    ];

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: const Text(
          "Michael De Ramos",
          style: TextStyle(color: CupertinoColors.white),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.back, color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileHeader(),
                    _buildMessageList(messages, context),
                  ],
                ),
              ),
            ),
            _buildMessageInput(), // Stays fixed at bottom
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'images/mike.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Michael De Ramos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: CupertinoColors.white),
          ),
          const Text(
            '@myykel27',
            style: TextStyle(color: CupertinoColors.systemGrey),
          ),
          const SizedBox(height: 4),
          const Text(
            '100 followers · 10 posts',
            style: TextStyle(color: CupertinoColors.systemGrey2),
          ),
          const Text(
            'You both follow Christian and 3 others',
            style: TextStyle(color: CupertinoColors.systemGrey2),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildMessageList(List<Map<String, String>> messages, BuildContext context) {
    return ListView.builder(
      reverse: true, // Starts from the bottom
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Prevents conflict with outer scroll
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index]; // Reverse list order
        return message["type"] == "sent"
            ? _buildSentMessage(message["text"]!, context)
            : _buildReceivedMessage(message["text"]!, "images/mike.jpg", context);
      },
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(12),

      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              placeholder: "Type a message...",
              placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
              style: const TextStyle(color: CupertinoColors.white),
            ),
          ),
          const SizedBox(width: 8),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.paperplane_fill, color: CupertinoColors.activeBlue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(String message, BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IntrinsicWidth(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: CupertinoColors.activeBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6, // Limits width
          ),
          child: Text(
            message,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildReceivedMessage(String message, String imageName, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageName,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          IntrinsicWidth(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4,
                borderRadius: BorderRadius.circular(16),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6, // Limits width
              ),
              child: Text(
                message,
                style: const TextStyle(color: CupertinoColors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

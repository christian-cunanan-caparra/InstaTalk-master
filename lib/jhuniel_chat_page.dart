import 'package:flutter/cupertino.dart';

class JhunielChatPage extends StatelessWidget {
  const JhunielChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> messages = [
      {"text": "Good morning sir, Penge food", "type": "received"},
      {"text": "Pakiss muna", "type": "sent"},
      {"text": "mwah!", "type": "received"},
      {"text": "Bukas may mcdo ka saken", "type": "sent"},
      {"text": "tsaka jollibee", "type": "sent"},
      {"text": "Thanksss sir mwa mwa chup chup!", "type": "received"},
    ];

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: const Text(
          "Jhuniel Galang",
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
              'images/Jhuniel.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Jhuniel Galang',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: CupertinoColors.white),
          ),
          const Text(
            '@Jhuniel',
            style: TextStyle(color: CupertinoColors.systemGrey),
          ),
          const SizedBox(height: 4),
          const Text(
            '1M followers · 1K posts',
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
            : _buildReceivedMessage(message["text"]!, "images/Jhuniel.jpg", context);
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

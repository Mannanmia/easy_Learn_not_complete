import 'package:easy_learn/api_handle/ai_chatbot.dart';
import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final OpenAIChatbot chatbot = OpenAIChatbot(
      apiKey: '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');
  final TextEditingController _textController = TextEditingController();
  final List<String> _chatHistory = [];

  void _handleSubmitted(String text) async {
    _textController.clear();
    _chatHistory.add('You: $text');
    setState(() {});

    try {
      String reply = await chatbot.getChatbotReply(text);
      _chatHistory.add('Chatbot: $reply');
      setState(() {});
    } catch (e) {
      _chatHistory.add(
          'We apologize, but it seems that we are currently experiencing technical difficulties, and our chatbot is temporarily unavailable. Please try again later.In the meantime, if you need assistance or have any questions, feel free to reach out to our support team at support@example.com.Thank you for your understanding.');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _chatHistory.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_chatHistory[index]),
              ),
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(hintText: 'Ask me!'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

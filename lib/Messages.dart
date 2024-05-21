import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final Set<int> selectedMessages = Set<int>(); // Store selected message indices

  void addToDietPlan(int index) {
    setState(() {
      selectedMessages.add(index); // Add the selected message index to the set
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: (context, index) {
        final isUserMessage = widget.messages[index]['isUserMessage'];
        final messageText = widget.messages[index]['message'].text.text[0];

        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: isUserMessage
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(isUserMessage ? 0 : 20),
                    topLeft: Radius.circular(isUserMessage ? 20 : 0),
                  ),
                  color: isUserMessage
                      ? Colors.grey.shade800
                      : Colors.grey.shade900.withOpacity(0.8),
                ),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(messageText),
              ),
              if (!isUserMessage)
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: selectedMessages.contains(index)
                      ? Colors.green // Change color if selected
                      : Colors.grey,
                ),
                onPressed: () {
                  addToDietPlan(index); // Call the function to add to diet plan
                },
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}

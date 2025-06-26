import 'package:chat_app/Widgets/chat_bubble.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/pages/viewmodel/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  TextEditingController messageContoller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  ChatPage({super.key});

  bool showUnderline = false;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    List<Message> messagelist = [];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kImage,
              width: 65,
            ),
            Text(
              'ChatApp',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagelist = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: _scrollController,
                  itemCount: messagelist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        messagelist[index].id == email
                            ? CahtBubble(message: messagelist[index])
                            : CahtBubbleForFriend(message: messagelist[index]),
                      ],
                    );
                  },
                );

                // return Loading();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: messageContoller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: value, email: email);

                messageContoller.clear();
              },
              decoration: InputDecoration(
                hintText: 'Send a message...',
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

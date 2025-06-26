import 'package:bloc/bloc.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference kmessage =
      FirebaseFirestore.instance.collection('message');
  void sendMessage({required String message, required String email}) {
    kmessage.add(
      {'message': message, kcreateAt: DateTime.now(), 'id': email},
    );
  }

  void getMessages() {
    kmessage.orderBy(kcreateAt, descending: true).snapshots().listen(
      (event) {
        List<Message> messagesList = [];
        for (var doc in event.docs) {
          messagesList.add(Message.forjson(doc));
        }
        emit(ChatSuccess(messages: messagesList));
      },
    );
  }
}

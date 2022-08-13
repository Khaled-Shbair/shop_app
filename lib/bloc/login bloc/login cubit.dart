import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api paths.dart';
import '../../api/dio helper.dart';
import 'login state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


/*
void userLogin({required String email, required String password}) {
  emit(LoginLoadingState());
  DioHelper.postData(
    url: ApiPaths.login,
    data: {
      'email': email,
      'password': password,
    },
  ).then((value) { // بعد ما جاب الداتا وخلص
   // print(value.data);
    emit(LoginSuccessState());
  }).catchError(
    (error) {
      emit(LoginErrorState(message: error));
    },
  );
}
*/
}

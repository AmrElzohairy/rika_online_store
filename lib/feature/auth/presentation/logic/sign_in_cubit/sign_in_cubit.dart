import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_online_store/feature/auth/data/models/sign_in_body.dart';
import 'package:rika_online_store/feature/auth/domain/entities/user_entity.dart';
import 'package:rika_online_store/feature/auth/domain/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signIn(SignInBody signInBody) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(signInBody);
    result.fold(
      (failure) {
        emit(SignInFailure(failure.message));
      },
      (user) {
        emit(SignInSuccess(user));
      },
    );
  }
}

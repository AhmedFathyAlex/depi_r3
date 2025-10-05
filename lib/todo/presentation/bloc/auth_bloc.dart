import 'package:depi_flutter/data/auth_repositiry.dart';
import 'package:depi_flutter/todo/data/auth_service.dart';
import 'package:depi_flutter/todo/presentation/bloc/auth_event.dart';
import 'package:depi_flutter/todo/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthRepositiry _authRepositiry = AuthRepositiry();

  initAuthBloc()async{
    _authRepositiry.initAuthRepo();
    
    if(AuthService.isLoggedIn){
      emit(Authenticated(user: AuthService.getCurrentUser));
    }
  }


  AuthBloc() : super(Unauthenticated()){
    on<LoginEvent>((event, emit)async{
      emit(Loading());
        try{
         var user = await AuthService.login(email: event.email, password: event.password);
          emit(Authenticated(user: user));
        }
        catch(e){
          emit(Error(e.toString()));
        }
    }
    );

    on<LogoutEvent>((event, emit)async{
      
    });

    on<SignupEvent>((event, emit)async{
      
    });

  }
}
import 'package:depi_flutter/data/auth_repositiry.dart';
import 'package:depi_flutter/state_managment/auth/auth_event.dart';
import 'package:depi_flutter/state_managment/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthRepositiry _authRepositiry = AuthRepositiry();

  initAuthBloc()async{
    _authRepositiry.initAuthRepo();
    bool isLoggedIn = await _authRepositiry.isLoggedIn();
    if(isLoggedIn){
      emit(Authenticated());
    }
  }


  AuthBloc() : super(Unauthenticated()){
    on<LoginEvent>((event, emit)async{
      emit(Loadig());
        try{
          await _authRepositiry.login(event.email, event.password);
          emit(Authenticated());
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
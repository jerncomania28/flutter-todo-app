import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/viewModels/todo_signup_view_model.dart';

class TodoSignUp extends StatelessWidget {
  TodoSignUp({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    final todoSignUpViewModel = context.watch<TodoSignUpViewModel>();

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextField(
                          controller: todoSignUpViewModel.firstName,
                          cursorColor: Colors.grey[600],
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 81, 23, 90)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            labelText: 'First Name',
                            hintText: 'Enter your First Name',
                          ),
                          onChanged: (String newFirstName) {
                            todoSignUpViewModel.updateFirstName(newFirstName);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: todoSignUpViewModel.lastName,
                          cursorColor: Colors.grey[600],
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 81, 23, 90)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            labelText: 'Last Name',
                            hintText: 'Enter your Last Name',
                          ),
                          onChanged: (String newLastName) {
                            todoSignUpViewModel.updateLastName(newLastName);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: todoSignUpViewModel.email,
                          cursorColor: Colors.grey[600],
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 81, 23, 90)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            labelText: 'Email',
                            errorText: todoSignUpViewModel.emailErrorText,
                            hintText: 'Enter your email',
                          ),
                          onChanged: (String newEmail) {
                            todoSignUpViewModel.updateEmail(newEmail);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: todoSignUpViewModel.password,
                          cursorColor: Colors.grey[600],
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 81, 23, 90)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            labelText: 'Password',
                            errorText: todoSignUpViewModel.passwordErrorText,
                            hintText: 'Enter your password',
                          ),
                          onChanged: (String newPassword) {
                            todoSignUpViewModel.updatePassword(newPassword);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: todoSignUpViewModel.confirmPassword,
                          cursorColor: Colors.grey[600],
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 81, 23, 90)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your password',
                          ),
                          onChanged: (String confirmPassword) {
                            todoSignUpViewModel
                                .updateConfirmPassword(confirmPassword);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 200),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 81, 23, 90),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        todoSignUpViewModel.submit();
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

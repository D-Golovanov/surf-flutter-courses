import 'package:flutter/material.dart';

sealed class FormPageState {}

class FormPageLoadingState extends FormPageState {}

class FormPageEnableState extends FormPageState {}

class FormPageDidabledState extends FormPageState {}

class FormPageSendingState extends FormPageState {}

class Model extends ChangeNotifier {}

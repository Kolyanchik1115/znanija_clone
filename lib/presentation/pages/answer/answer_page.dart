import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/presentation/blocs/answers/answer_bloc.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  AnswerPageState createState() => AnswerPageState();
}

class AnswerPageState extends State<AnswerPage> {
  final TextEditingController _textController = TextEditingController();
  File? _selectedFile;
  List<File> _selectedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true, // Разрешить выбор нескольких файлов
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFiles = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  Future<void> _uploadFiles(AnswerBloc answerBloc) async {
    if (_selectedFiles.isEmpty) {
      return;
    }

    try {
      final text = _textController.text;
      const questionId = 3;

      answerBloc.add(AddAnswerEvent(text: text, questionId: questionId, file: _selectedFiles));
    } catch (e) {
      print('Ошибка при отправке ответа: $e');
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnswerBloc(),
      child: BlocBuilder<AnswerBloc, AnswerState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(labelText: 'Текст ответа'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _pickFiles,
                  child: Text(_selectedFile != null ? 'Выбран файл' : 'Выбрать файл'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _uploadFiles(context.read<AnswerBloc>()),
                  child: const Text('Отправить ответ'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

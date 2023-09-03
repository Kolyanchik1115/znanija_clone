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
  List<File> _selectedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFiles = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  void _removeFile(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(labelText: 'Текст ответа'),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _pickFiles,
                  child: Text(_selectedFiles.isNotEmpty ? 'Выбрано файлов: ${_selectedFiles.length}' : 'Выбрать файлы'),
                ),
                const SizedBox(height: 16.0),
                Column(
                  children: List.generate(_selectedFiles.length, (index) {
                    final file = _selectedFiles[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(file.path.split('/').last),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _removeFile(index);
                          },
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<AnswerBloc>()
                        .add(AddAnswerEvent(text: _textController.text, questionId: 3, file: _selectedFiles));
                    Navigator.pop(context);
                  },
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

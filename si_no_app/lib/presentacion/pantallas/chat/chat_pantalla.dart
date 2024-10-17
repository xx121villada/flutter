import 'package:flutter/material.dart';
import 'package:si_no_app/presentacion/widgets/chat/mi_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/chat/su_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/compartido/caja_de_texto.dart';

class ChatPantalla extends StatelessWidget{
  const ChatPantalla({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.eltiempo.com%2Fvida%2Fciencia%2Fhistorias-del-cosmos-el-entorno-extremo-del-espacio-exterior-que-nos-rodea-717526&psig=AOvVaw1GbWMqaWnunLnrizAaTF-I&ust=1729287108620000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj-3dCulokDFQAAAAAdAAAAABAJ"),
          ),
        ),
        title: const Text("XIMENA"),
        centerTitle: false,
      ),
      body:_ChatView()
    );
  } 
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index){
                  return (index % 2 == 0)
                  ?const SuMensajeBurbuja()
                  :const MiMensajeBurbuja();
                })),
                const CajadeTexto(),
          ],
        ),
      ),
    );
  }
}
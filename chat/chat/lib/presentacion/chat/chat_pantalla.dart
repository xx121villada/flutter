import 'package:flutter/material.dart'
// import 'package:chat/presentacion/'

class ChatPantalla extends StatelessWidget{
  const ChatPantalla({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ),
        title: const Text("Emilia"),
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
                }))
                const CajadeTexto();
          ],
        ),
      ),
    );
  }
}
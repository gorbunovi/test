import 'package:flutter/material.dart';

class PreViewWidget extends StatelessWidget {
  const PreViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 5,),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('My specialization: Strength and Conditioning'),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Aleksei Oleynik',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/photo.jpg'),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:ElevatedButton.styleFrom(primary: Colors.indigoAccent),
                    onPressed: (){},
                  child: const Text('VIEW ALL COURSES', style: TextStyle(color: Colors.white),),
                ),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(primary: Colors.brown),
                  onPressed: (){},
                  child:const Text('REMOVE FROM FAVORITE', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:ElevatedButton.styleFrom(primary: Colors.black12),
                  onPressed: (){},
                  child: const Text('Strengh and Condition'),
                ),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(primary: Colors.black12),
                  onPressed: (){},
                  child:const Text('Material Arts'),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '“Boa-Constrictor” TOP 10 heavyweight UFC fighter! MMA legend ! Proud husband and father !',
                style: TextStyle(color: Colors.black54,fontSize: 24,fontWeight: FontWeight.w900),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      )
    );
  }
}

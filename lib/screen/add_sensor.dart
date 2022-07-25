import 'package:flutter/material.dart';


class AddSensor extends StatelessWidget {
  const AddSensor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:  Center(child: Text('Add Sensor',style: TextStyle(
                fontSize: 20
              ),)),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Row(
                  children: const[
                     Icon(Icons.sensors,size: 30,),
                    SizedBox(
                      width: 20,
                    ),
                     Text('ESP-9CBM',style: TextStyle(
                      fontSize: 19
                    ),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                isExpanded: true,
                items: const[
                 DropdownMenuItem(child: Text('Main Tank'))
              ], onChanged: (val){}),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                onPressed: (){}, child: const Text('ADD',style: TextStyle(
                  color: Colors.white
                ),)),
            )
          ],
        ),
      ),
    );
  }
}

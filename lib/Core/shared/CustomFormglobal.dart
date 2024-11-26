
import 'package:flutter/material.dart';

class CustumFormGlobal extends StatelessWidget {
  final String label;
  final String hinttext;
  final IconData icon;
 final TextEditingController mycontroller;
 final String? Function(String?)? valid;
 final bool isNumber;
 final bool? obsecureText;
 final void Function()? onTapIcon;

  const CustumFormGlobal({
    super.key,
     this.onTapIcon,
     this.obsecureText,
     required this.label, 
     required this.hinttext, 
     required this.icon, 
     required this.mycontroller,
     required this.valid,
     required this.isNumber
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
             
             controller: mycontroller,
                          validator:valid ,
                          obscureText: obsecureText==null || obsecureText!=false?false:true,
                          decoration: InputDecoration(
                            floatingLabelBehavior:FloatingLabelBehavior.always ,
                            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            label: Text(label) ,
                            hintText: hinttext,
                            suffixIcon: InkWell(
                              onTap: onTapIcon,
                              child: Icon(icon),
                            )
                          ),
                          keyboardType: isNumber?TextInputType.number:  TextInputType.text,
                        ),
    );
  }
}
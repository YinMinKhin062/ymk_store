import 'package:flutter/material.dart';

import '../../../../../common/widgets/customShapes/containers/circularContainer.dart';
import '../../../../../utils/theme/custom_themes/helperFunctions.dart';

class MyRawChip extends StatefulWidget {
  const MyRawChip(
      {super.key,
      required this.text,
      required this.isSelected,
      this.onSelected,
      this.isEnabled=true,
      });

  final bool isSelected;
  final bool isEnabled;
  final String text;
  final void Function(bool)? onSelected;

  @override
  State<MyRawChip> createState() => _MyRawChipState();
}

class _MyRawChipState extends State<MyRawChip> {
  
  @override
  Widget build(BuildContext context) {
    // bool changeSelected=widget.isSelected;
    final hasColor = MyHelperFunctions.getColor(widget.text);
    return RawChip(
      disabledColor: Colors.grey.withOpacity(.3),
        label: hasColor != null
            ? const SizedBox()
            : Text(
                widget.text,
              ),
        selected: widget.isSelected,
        onSelected:widget.onSelected,
        isEnabled:widget.isEnabled ,
        checkmarkColor: widget.isSelected && hasColor==Colors.white? Colors.black : widget.isSelected ? Colors.white :null,
        // checkmarkColor: isSelected ? Colors.white :null,
        labelStyle: TextStyle(
            color: widget.isSelected ? Colors.white :null, fontSize: 12),
        selectedColor: hasColor!=null ? Colors.white: Colors.deepPurple,
        // side:isSelected? BorderSide(color: Colors.grey.withOpacity(.2)):null,
        
        avatar: hasColor != null
            ? CircularContainer(
                width: 50,
                height: 50,
                bgColor: hasColor,
              )
            : null,
        shape: hasColor != null ? const CircleBorder() : null,
        labelPadding: hasColor != null ? EdgeInsets.zero : null,
        padding: hasColor != null ? const EdgeInsets.all(2) : null,
        shadowColor: null,
       
       
      );
    
  }
}

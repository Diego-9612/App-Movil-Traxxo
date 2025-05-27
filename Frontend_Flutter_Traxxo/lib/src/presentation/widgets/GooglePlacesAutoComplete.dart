import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class GooglePlacesAutoComplete extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  Function(Prediction prediction) onPlaceSelected;

  GooglePlacesAutoComplete(
    this.controller,
    this.hintText,
    this.onPlaceSelected,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller,

        boxDecoration: BoxDecoration(color: Colors.white),
        googleAPIKey: "AIzaSyC2yTTw8jTbm9SZjouoJ8HViPuw9kRT31U",
        inputDecoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: ["co"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: onPlaceSelected,
        itemClick: (Prediction prediction) {
          controller.text = prediction.description ?? "";
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: prediction.description?.length ?? 0),
          );
        },
        seperatedBuilder: Divider(),
        containerHorizontalPadding: 10,

        // OPTIONAL// If you want to customize list view item builder
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 7),
                Expanded(child: Text("${prediction.description ?? ""}")),
              ],
            ),
          );
        },

        isCrossBtnShown: true,

        // default 600 ms ,
      ),
    );
  }
}

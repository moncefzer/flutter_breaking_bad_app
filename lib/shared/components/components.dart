import 'package:flutter/material.dart';

Widget buildLoadingIndicator() => const Center(
      child: CircularProgressIndicator(),
    );

Widget defaultButton({
  double width = double.infinity,
  Color backgroundColor = Colors.blue,
  double radius = 4,
  bool isUpperCase = true,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback onPressed,
  required String text,
}) =>
    TextButton(onPressed: onPressed, child: Text(text.toUpperCase()));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  FormFieldValidator<String>? validate,
  // String label,
  String? hint,
  IconData? prefix,
  VoidCallback? onTap,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isPassword = false,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
}) =>
    TextFormField(
      obscureText: isPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validate,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      keyboardType: type,
      onTap: onTap,
      decoration: InputDecoration(
        // labelText: label,
        hintText: hint,
        // prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: InputBorder.none,
      ),
    );

Widget buildCenterText(
        {String text = 'Hello',
        double size = 17,
        Color color = Colors.black45,
        FontWeight fontWeight = FontWeight.w600}) =>
    Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );

Widget buildDivider() => Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        width: double.infinity,
        height: 1.5,
        color: Colors.grey[200],
      ),
    );

// Future showToast({required String text, required ToastStates state}) =>
//     Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );

Color chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.WARNING:
      return Colors.amber;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.SUCCESS:
      return Colors.green;
  }
}

enum ToastStates { SUCCESS, ERROR, WARNING }

void navigatoTo({required BuildContext context, required Widget widget}) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));

void navigatoAndFinish(
        {required BuildContext context, required Widget widget}) =>
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

///snackBar
void showSnackbar(context, String text) {
  var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(10),
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}

// Widget buildNetworkImage(
//     url, {
//       double height = 40,
//       double width = 40,
//       BoxFit fit = BoxFit.none,
//     }) =>
//     CachedNetworkImage(
//       imageUrl: url,
//       height: height,
//       width: width,
//       fit: fit,
//       placeholder: (context, url) => buildLoadingIndicator(),
//       errorWidget: (context, url, error) => const Icon(Icons.error),
//     );

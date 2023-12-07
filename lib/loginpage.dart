import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veparatask/homepage.dart';
import 'package:veparatask/v.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextCtrl = TextEditingController();
  final TextEditingController passwordTextCtrl = TextEditingController();

  final Widget gap = const SizedBox(height: 24.0);

  FormFieldValidator<String>? get validator => (input) {
    if (input!.trim().isEmpty) return "Please enter a valid content";
    else return null;
  };

  final ValueNotifier<bool> check = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              //fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(V.loginImagePath, fit: BoxFit.fill, width: double.maxFinite),
                const CustomPaint(
                  painter: CustomShapePainter(),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: kToolbarHeight,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Giriş Yapın", style: TextStyle(fontSize: V.textSize4, fontWeight: FontWeight.w700)),
                      Text("\nHoşgeldiniz, bilgilerinizi girerek giriş yapabilirsiniz.", style: TextStyle(fontSize: V.textSize1)),
                      gap,
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("E posta adresi"),
                        ),
                        validator: validator,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Şifre"),
                        ),
                        validator: validator,
                      ),
                      gap,
                      Row(
                        children: [
                          SizedBox.square(
                            dimension: 24.0,
                            child: ValueListenableBuilder(
                              valueListenable: check,
                              builder: (ctx, bool value, _) {
                                if (value) return InkWell(
                                  child: SvgPicture.asset(V.checkboxImagePath),
                                  onTap: () => check.value = !check.value,
                                );
                                else return Checkbox(
                                  value: value,
                                  onChanged: (value) => check.value = value!,
                                );
                              }
                            ),
                          ),
                          Text("  Beni hatırla", style: TextStyle(fontSize: V.textSize2)),
                          const Expanded(child: SizedBox()),
                          Text("Şifremi unuttum", style: TextStyle(decoration: TextDecoration.underline, fontSize: V.textSize2)),
                        ],
                      ),
                      gap,
                      ElevatedButton(
                        child: const Text("Giriş Yap"),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  const CustomShapePainter({Key? key});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = V.backgroundColor
      ..strokeWidth = 0.1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
    ;
    Path path = Path()
    // Start point is top left
      ..moveTo(0, size.height)
      ..arcToPoint(Offset(size.width / 8, 0), radius: Radius.circular(size.height))
      ..lineTo(size.width, size.height)
      ..close()
    ;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

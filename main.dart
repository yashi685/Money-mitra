// main.dart
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';



void main() {
  runApp(const MoneyMitraApp());
}

class MoneyMitraApp extends StatelessWidget {
  const MoneyMitraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MoneyMitra",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB33791)),
        useMaterial3: true,
      ),
      home: WelcomePage(),
    );
  }
}

/// ================== Helper TextField ==================
Widget buildTextField(TextEditingController controller, String label,
    {IconData? icon,
      bool obscureText = false,
      TextInputType keyboardType = TextInputType.text}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    validator: (value) => value == null || value.isEmpty ? "Enter $label" : null,
    decoration: InputDecoration(
      prefixIcon: icon != null ? Icon(icon, color: Colors.deepPurple) : null,
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
/// ================== Gradient background widget==================
class GradientPanel extends StatelessWidget {
  final double height;
  const GradientPanel({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB33791),
            Color(0xFFC562AF),
            Color(0xFFDB8DD0),
            Color(0xFFFEC5F6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.rocket_launch, size: 80, color: Colors.white),
            SizedBox(height: 16),
            Text(
              "MoneyMitra",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Your smart financial partner",
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
/// ================== WELCOME PAGE ==================
/// ================== MERGED WELCOME PAGE ==================
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _pageController;

  late Animation<double> _logoScale;
  late Animation<double> _logoFade;
  late Animation<Offset> _textSlide;
  late Animation<double> _textFade;
  late Animation<Offset> _button1Slide;
  late Animation<double> _button1Fade;
  late Animation<Offset> _button2Slide;
  late Animation<double> _button2Fade;

  @override
  void initState() {
    super.initState();
    _pageController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Logo Animations
    _logoScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _pageController,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
      ),
    );
    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _pageController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Text Animations
    _textSlide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _pageController,
            curve: const Interval(0.25, 0.7, curve: Curves.easeOutCubic),
          ),
        );
    _textFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _pageController,
        curve: const Interval(0.25, 0.65, curve: Curves.easeIn),
      ),
    );

    // Buttons Animations
    _button1Slide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _pageController,
            curve: const Interval(0.45, 0.9, curve: Curves.easeOutCubic),
          ),
        );
    _button1Fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _pageController,
        curve: const Interval(0.45, 0.85, curve: Curves.easeIn),
      ),
    );

    _button2Slide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _pageController,
            curve: const Interval(0.55, 1.0, curve: Curves.easeOutCubic),
          ),
        );
    _button2Fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _pageController,
        curve: const Interval(0.55, 0.95, curve: Curves.easeIn),
      ),
    );

    _pageController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              width: 350, // 🔹 fixed card width
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated Logo
                  ScaleTransition(
                    scale: _logoScale,
                    child: FadeTransition(
                      opacity: _logoFade,
                      child: SizedBox(
                        height: 120,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Animated Text Block
                  FadeTransition(
                    opacity: _textFade,
                    child: SlideTransition(
                      position: _textSlide,
                      child: Column(
                        children: const [
                          Text(
                            "MONEY MITRA",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB33791),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Your trusted partner for smart money management",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Welcome to Money Mitra",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Manage your finances smarter\nwith AI-powered insights",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Animated Buttons (fixed width)
                  FadeTransition(
                    opacity: _button1Fade,
                    child: SlideTransition(
                      position: _button1Slide,
                      child: SizedBox(
                        width: 250, // 🔹 compact button
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB33791), // 🔹 Purple background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // 🔹 White text
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeTransition(
                    opacity: _button2Fade,
                    child: SlideTransition(
                      position: _button2Slide,
                      child: SizedBox(
                        width: 250, // 🔹 compact button
                        height: 48,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color(0xFFB33791), width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterPage()),
                            );
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(color: Color(0xFFB33791)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


///  ---------- LOGIN PAGE ----------
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool wide = screenWidth > 700;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            width: wide ? 700 : screenWidth * 0.9,
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  if (wide) const Expanded(flex: 2, child: GradientPanel(height: 500)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "User log In",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB33791),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: false, onChanged: (v) {}),
                                  const Text("Remember Me"),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Forgot Password?"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // ===== LOGIN BUTTON → OtpPage =====
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB33791),
                                foregroundColor: Colors.white,
                                padding:
                                const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const OtpPage(), // 👈 Connected here
                                  ),
                                );
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don’t have an account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const RegisterPage()),
                                  );
                                },
                                child: const Text("Register Here"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


///  ---------- REGISTER PAGE ----------
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool wide = screenWidth > 700;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            width: wide ? 700 : screenWidth * 0.9,
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  if (wide) const Expanded(flex: 2, child: GradientPanel(height: 600)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB33791),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "Full Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB33791),
                                foregroundColor: Colors.white,
                                padding:
                                const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "REGISTER",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginPage()),
                                  );
                                },
                                child: const Text("Login Here"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================== OTP PAGE ==================
class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _selectedMethod = 'Phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDFDFD),
              Color(0xFFFDFDFD),
              Color(0xFFFBFBFB),
              Color(0xFFF9F9F9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDEDF3), // ✅ light pink like LoginPage
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon inside rounded container like mobile UI
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB33791).withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mark_email_unread,
                        size: 60,
                        color: Color(0xFFB33791),
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      "Enter Verification Code",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    // Delivery method selector
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedMethod,
                          style: const TextStyle(color: Colors.black87),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.black87),
                          items: const [
                            DropdownMenuItem(
                              value: 'Phone',
                              child: Text('Send OTP to Phone'),
                            ),
                            DropdownMenuItem(
                              value: 'Email',
                              child: Text('Send OTP to Email'),
                            ),
                          ],
                          onChanged: (val) {
                            if (val != null) {
                              setState(() => _selectedMethod = val);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "We have sent an OTP to your $_selectedMethod",
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 16),

                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // OTP boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                            (index) => SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {
                        // TODO: resend OTP logic
                      },
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(
                          color: Color(0xFFB33791),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ✅ Navigate to HomePage after verification
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB33791),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          "VERIFY",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/// ================== HOME PAGE (Bottom Nav) ==================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Keeps track of which bottom-nav item is selected
  int _currentIndex = 0;

  // List of screens in the same order as the bottom navigation items
  final List<Widget> _pages = const [
    DashboardPage(),
    FundFinderPage(),   // NEW: Fund Finder section
    FAQPage(),
    FullProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFB33791),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Fund Finder",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: "FAQ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

/// ---------------- Dashboard with Cards + Chatbot ----------------
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        "title": "Learn & Earn",
        "desc": "Start your financial journey with easy lessons.",
        "image": "assets/images/learn.png",
        "page": const DummyPage(title: "Learn & Earn"),
      },
      {
        "title": "SIP Calculator",
        "desc": "Plan your investments and returns smartly.",
        "image": "assets/images/calculator.png",
        "page": const SIPCalculatorPage(),
      },
      {
        "title": "Become Crorepati",
        "desc": "See how long it takes to reach 1 crore.",
        "image": "assets/images/crorepati.png",
        "page": const CrorepatiPage(),
      },
      {
        "title": "Goal Achiever",   // The title shown on your dashboard/card
        "desc": "Track and achieve your financial goals.", // The description text
        "image": "assets/images/goal.png", // Path to your image in assets
        "page":  const SipGoalPlanner(), // The widget (screen) it should open
      },
      {
        "title": "High Return Funds",
        "desc": "Find mutual funds with better returns.",
        "image": "assets/images/highreturn.png",
        "page": const DummyPage(title: "High Return Funds"),
      },
      {
        "title": "Testimonials",
        "desc": "See what our users have to say!",
        "image": "assets/images/testimonials.png",
        "page": const Testimonials(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Mitra"),
        backgroundColor: const Color(0xFFB33791),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.82,
              children: features
                  .map((f) => FeatureCard(
                title: f["title"] as String,
                desc: f["desc"] as String,
                image: f["image"] as String,
                page: f["page"] as Widget,
              ))
                  .toList(),
            ),
          ),
          const ChatBotButton(), // chatbot popup button on Dashboard only
        ],
      ),
    );
  }
}

/// ---------------- Feature Card ----------------
class FeatureCard extends StatefulWidget {
  final String title;
  final String desc;
  final String image;
  final Widget page;

  const FeatureCard({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    required this.page,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => widget.page));
      },
      onHover: (value) {
        // Hover will only work on web/desktop; safe to call
        setState(() => _hovering = value);
      },
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _hovering
                ? const [Color(0xFFC562AF), Color(0xFFB33791)]
                : const [Color(0xFFFEC5F6), Color(0xFFDB8DD0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: _hovering ? 10 : 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: _hovering ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                height: 70,
                child: Image.asset(widget.image, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              widget.desc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.black54, height: 1.4),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- SIP Calculator Page ----------------
class SIPCalculatorPage extends StatefulWidget {
  const SIPCalculatorPage({super.key});

  @override
  State<SIPCalculatorPage> createState() => _SIPCalculatorPageState();
}

class _SIPCalculatorPageState extends State<SIPCalculatorPage> {
  double monthly = 1000;
  double years = 5;
  double rate = 12;

  @override
  Widget build(BuildContext context) {
    double total = monthly * years * 12;
    double futureValue = monthly *
        ((pow(1 + rate / 1200, years * 12) - 1) / (rate / 1200)) *
        (1 + rate / 1200);

    return Scaffold(
      appBar: AppBar(title: const Text("SIP Calculator"), backgroundColor: const Color(0xFFB33791)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SliderWidget(
              label: "Monthly Investment",
              value: monthly,
              min: 500,
              max: 20000,
              step: 500,
              onChanged: (v) => setState(() => monthly = v),
            ),
            SliderWidget(
              label: "Investment Duration (Years)",
              value: years,
              min: 1,
              max: 30,
              step: 1,
              onChanged: (v) => setState(() => years = v),
            ),
            SliderWidget(
              label: "Expected Return Rate (%)",
              value: rate,
              min: 5,
              max: 20,
              step: 0.5,
              onChanged: (v) => setState(() => rate = v),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Total Invested: ₹${total.toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("Future Value: ₹${futureValue.toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 18, color: Color(0xFFB33791))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- Become Crorepati Page ----------------
class CrorepatiPage extends StatefulWidget {
  const CrorepatiPage({super.key});

  @override
  State<CrorepatiPage> createState() => _CrorepatiPageState();
}

class _CrorepatiPageState extends State<CrorepatiPage> {
  double monthly = 5000;
  double rate = 12;

  int calculateYears() {
    double futureValue = 0;
    int months = 0;
    while (futureValue < 10000000) {
      months++;
      futureValue = monthly *
          ((pow(1 + rate / 1200, months) - 1) / (rate / 1200)) *
          (1 + rate / 1200);
    }
    return (months / 12).ceil();
  }

  @override
  Widget build(BuildContext context) {
    int years = calculateYears();

    return Scaffold(
      appBar: AppBar(title: const Text("Become Crorepati"), backgroundColor: const Color(0xFFB33791)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SliderWidget(
              label: "Monthly SIP Amount",
              value: monthly,
              min: 1000,
              max: 50000,
              step: 1000,
              onChanged: (v) => setState(() => monthly = v),
            ),
            SliderWidget(
              label: "Expected Return Rate (%)",
              value: rate,
              min: 5,
              max: 20,
              step: 0.5,
              onChanged: (v) => setState(() => rate = v),
            ),
            const SizedBox(height: 20),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFB33791), Color(0xFFC562AF)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "With a SIP of ₹${monthly.toStringAsFixed(0)},\n"
                    "you can become a Crorepati in ~ $years years!",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- Chatbot Button + Popup ----------------
class ChatBotButton extends StatefulWidget {
  const ChatBotButton({super.key});

  @override
  State<ChatBotButton> createState() => _ChatBotButtonState();
}

class _ChatBotButtonState extends State<ChatBotButton> {
  bool _open = false;
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = ["Hi! I’m your Money Mitra bot. How can I help?"];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_open)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: 300,
              height: 320,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFD592C8), Color(0xFFDB8DD0)]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6)],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(_messages[index]),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(hintText: "Ask..."),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: Color(0xFFB33791)),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              _messages.add("You: ${_controller.text}");
                              _messages.add("Bot: Working on '${_controller.text}'");
                              _controller.clear();
                            });
                          }
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          GestureDetector(
            onTap: () => setState(() => _open = !_open),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFFB33791),
              child: Image.asset("assets/images/chatbot.png", height: 30),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------- Reusable Slider Widget ----------------
class SliderWidget extends StatelessWidget {
  final String label;
  final double value, min, max, step;
  final ValueChanged<double> onChanged;

  const SliderWidget({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.step,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label: ${value.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.bold)),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: ((max - min) / step).round(),
          activeColor: const Color(0xFFB33791),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

/// ---------------- Dummy + FAQ ----------------
class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title), backgroundColor: const Color(0xFFB33791)),
    body: Center(child: Text("$title Page Coming Soon!", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
  );
}

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(child: Text("FAQ Section Coming Soon")),
  );
}

/// ---------------- Full Profile Page (from first code) ----------------

class FullProfilePage extends StatefulWidget {
  const FullProfilePage({super.key});

  @override
  _FullProfilePageState createState() => _FullProfilePageState();
}

class _FullProfilePageState extends State<FullProfilePage> {
  File? profileImage;
  final picker = ImagePicker();

  final panController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future pickImage(ImageSource source) async {
    final pickedFile =
    await picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) setState(() => profileImage = File(pickedFile.path));
  }

  // Professional, neutral label style
  Widget buildTextInput(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          // ✅ Neutral dark gray label instead of pink
          labelStyle: const TextStyle(color: Color(0xFF374151)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFB33791)),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (v) =>
        (v == null || v.trim().isEmpty) ? "Required field" : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEC5F6),
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: const Color(0xFFB33791),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: const Color(0xFFDB8DD0),
                      backgroundImage:
                      profileImage != null ? FileImage(profileImage!) : null,
                      child: profileImage == null
                          ? const Icon(Icons.person,
                          size: 55, color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => SizedBox(
                              height: 120,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.camera),
                                    title: const Text("Camera"),
                                    onTap: () {
                                      pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.photo),
                                    title: const Text("Gallery"),
                                    onTap: () {
                                      pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFFB33791),
                          child: Icon(Icons.edit, size: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ===== Inputs with neutral label color =====
              buildTextInput(nameController, "Full Name"),
              buildTextInput(panController, "PAN Card Number"),
              buildTextInput(ageController, "Age", keyboardType: TextInputType.number),
              buildTextInput(genderController, "Gender"),
              buildTextInput(streetController, "Street Address"),
              buildTextInput(cityController, "City"),
              buildTextInput(stateController, "State"),
              buildTextInput(pinController, "PIN Code", keyboardType: TextInputType.number),

              const SizedBox(height: 25),

              // ===== Save Profile Button =====
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profile Saved Successfully ✅"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC562AF),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Save Profile",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===== Logout Button =====
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB33791),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/// ---------------- SIP goal planner ----------------

class SipGoalPlanner extends StatefulWidget {
  const SipGoalPlanner({super.key});
  @override
  State<SipGoalPlanner> createState() => _SipGoalPlannerState();
}

class _SipGoalPlannerState extends State<SipGoalPlanner> {
  final TextEditingController wealthController = TextEditingController();
  final TextEditingController returnController = TextEditingController();
  final TextEditingController tenureController = TextEditingController();
  String investmentFrequency = "Monthly";
  String adjustForInflation = "NO";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Goal Planning - SIP"),
        backgroundColor: const Color(0xFFB33791),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // wider professional box
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      "How much should you invest Annually or Monthly to Make Wealth? "
                          "Calculate the Investment Amount using our Regular Investment Calculator.",
                      style: TextStyle(fontSize: 15, color: Color(0xFF374151)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Frequency
                    DropdownButtonFormField<String>(
                      value: investmentFrequency,
                      decoration: InputDecoration(
                        labelText: "Frequency of Investment",
                        labelStyle: const TextStyle(color: Color(0xFF374151)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFB33791),
                            width: 2,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      iconEnabledColor: const Color(0xFFB33791),
                      items: const [
                        DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
                        DropdownMenuItem(value: "Yearly", child: Text("Yearly")),
                      ],
                      onChanged: (val) {
                        setState(() => investmentFrequency = val!);
                      },
                    ),
                    const SizedBox(height: 16),

                    // Targeted Wealth
                    TextField(
                      controller: wealthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Targeted Wealth *",
                        hintText: "Ex: 1000",
                        labelStyle: const TextStyle(color: Color(0xFF374151)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFB33791),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Expected return
                    TextField(
                      controller: returnController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Expected rate of return (P.A) *",
                        hintText: "Ex: 12%",
                        labelStyle: const TextStyle(color: Color(0xFF374151)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFB33791),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tenure
                    TextField(
                      controller: tenureController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Tenure (in years) * (Up to 50 years)",
                        hintText: "Ex: 10",
                        labelStyle: const TextStyle(color: Color(0xFF374151)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFB33791),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Inflation
                    DropdownButtonFormField<String>(
                      value: adjustForInflation,
                      decoration: InputDecoration(
                        labelText: "Adjust for Inflation",
                        labelStyle: const TextStyle(color: Color(0xFF374151)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFB33791),
                            width: 2,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      iconEnabledColor: const Color(0xFFB33791),
                      items: const [
                        DropdownMenuItem(value: "NO", child: Text("NO")),
                        DropdownMenuItem(value: "YES", child: Text("YES")),
                      ],
                      onChanged: (val) {
                        setState(() => adjustForInflation = val!);
                      },
                    ),
                    const SizedBox(height: 24),

                    // Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: const Color(0xFFB33791),
                              content: Text(
                                "Calculating SIP Goal for ₹${wealthController.text} in ${tenureController.text} years...",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB33791),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 6,
                        ),
                        child: const Text(
                          "Plan My SIP Goal",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ================== Testimonials ==================
class Testimonials extends StatefulWidget {
  const Testimonials({super.key});

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  final List<Map<String, String>> testimonials = [
    {
      "name": "Anita Sharma",
      "feedback":
      "MoneyMitra helped me plan my investments perfectly! The SIP calculator is very simple and useful.",
      "date": "March 2025"
    },
    {
      "name": "Rohan Singh",
      "feedback":
      "The goal planner feature motivated me to stay on track and achieve my financial targets.",
      "date": "July 2025"
    },
    {
      "name": "Priya Mehta",
      "feedback":
      "Great app with easy navigation and accurate results. Love the color theme—it’s very appealing!",
      "date": "August 2025"
    },
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  void _showAddCommentDialog() {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            title: const Text("Add Testimonial"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Your Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: feedbackController,
                  decoration: const InputDecoration(
                    labelText: "Your Feedback",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  nameController.clear();
                  feedbackController.clear();
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB33791),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      feedbackController.text.isNotEmpty) {
                    setState(() {
                      testimonials.add({
                        "name": nameController.text,
                        "feedback": feedbackController.text,
                        "date":
                        "${DateTime
                            .now()
                            .month}/${DateTime
                            .now()
                            .year}", // simple date
                      });
                    });
                    Navigator.pop(context);
                    nameController.clear();
                    feedbackController.clear();
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Testimonials"),
        backgroundColor: const Color(0xFFB33791),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          itemCount: testimonials.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final testimonial = testimonials[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"${testimonial["feedback"]}"',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.4),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "- ${testimonial["name"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB33791),
                          fontSize: 14),
                    ),
                    Text(
                      testimonial["date"] ?? "",
                      style:
                      const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFB33791),
        onPressed: _showAddCommentDialog,
        child: const Icon(Icons.add_comment, color: Colors.white),
      ),
    );
  }
}
/// ================== Fund Finder==================
class FundFinderPage extends StatelessWidget {
  const FundFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fund Finder'),
        backgroundColor: const Color(0xFFB33791),
      ),
      body: const Center(
        child: Text(
          'Fund Finder Coming Soon',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

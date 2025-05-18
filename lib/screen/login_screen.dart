import 'package:flutter/material.dart';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  bool _isLoading = false;
  bool _obscurePassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    // Create fade animation
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Simulates login process
  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pushReplacementNamed('/home');
  }

  // Get responsive size based on screen width
  double _getResponsiveSize(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return baseSize * 0.8;
    if (width < 600) return baseSize;
    if (width < 900) return baseSize * 1.2;
    return baseSize * 1.5;
  }

  // Get responsive padding based on screen size
  EdgeInsets _getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isLandscape = width > height;

    if (width < 360) return EdgeInsets.all(16);
    if (width < 600) return EdgeInsets.all(24);

    // For tablets and larger screens, center the form with max width
    return EdgeInsets.symmetric(
      horizontal: isLandscape ? width * 0.25 : width * 0.1,
      vertical: 32,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;
    final isTablet = size.width > 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF43A047),
              Color(0xFF2E7D32),
              Color(0xFF1B5E20),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: _getResponsivePadding(context),
                      child: isLandscape && !isTablet
                          ? _buildLandscapeLayout(context)
                          : _buildPortraitLayout(context),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        SizedBox(height: _getResponsiveSize(context, 30)),
        _buildLoginForm(context),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: _buildHeader(context),
        ),
        Expanded(
          flex: 6,
          child: _buildLoginForm(context),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isLandscape = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _animationController.value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - _animationController.value)),
            child: child,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo with animated glow effect
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 1200),
            builder: (context, value, child) {
              return Transform.scale(
                scale: 0.8 + (value * 0.2),
                child: Container(
                  width: _getResponsiveSize(context, 120),
                  height: _getResponsiveSize(context, 120),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2 * value),
                        blurRadius: 30 * value,
                        spreadRadius: 10 * value,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.8),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.coffee,
                        size: _getResponsiveSize(context, 60),
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          if (!isLandscape) SizedBox(height: _getResponsiveSize(context, 20)),

          // App name with animated text
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: Text(
              'COFFEE APP',
              style: TextStyle(
                fontSize: _getResponsiveSize(context, 28),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),

          if (!isLandscape) SizedBox(height: _getResponsiveSize(context, 10)),

          // Tagline with animated text
          if (!isLandscape)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Your perfect brew, just a tap away',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _getResponsiveSize(context, 16),
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(_getResponsiveSize(context, 24)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Form title with staggered animation
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final delay = 0.1;
                    final value = (_animationController.value - delay) / (1 - delay);
                    final opacity = value < 0 ? 0.0 : value;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - opacity)),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: _getResponsiveSize(context, 26),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(
                          fontSize: _getResponsiveSize(context, 16),
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: _getResponsiveSize(context, 30)),

                // Email Field with staggered animation
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final delay = 0.2;
                    final value = (_animationController.value - delay) / (1 - delay);
                    final opacity = value < 0 ? 0.0 : value;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - opacity)),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: _getResponsiveSize(context, 14),
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _emailController,
                          style: TextStyle(
                            fontSize: _getResponsiveSize(context, 16),
                          ),
                          decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF2E7D32), width: 1.5),
                            ),
                            prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF2E7D32)),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: _getResponsiveSize(context, 16),
                              horizontal: _getResponsiveSize(context, 16),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: _getResponsiveSize(context, 20)),

                // Password Field with staggered animation
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final delay = 0.3;
                    final value = (_animationController.value - delay) / (1 - delay);
                    final opacity = value < 0 ? 0.0 : value;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - opacity)),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: _getResponsiveSize(context, 14),
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: TextStyle(
                            fontSize: _getResponsiveSize(context, 16),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF2E7D32), width: 1.5),
                            ),
                            prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF2E7D32)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: Color(0xFF2E7D32),
                                size: _getResponsiveSize(context, 20),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: _getResponsiveSize(context, 16),
                              horizontal: _getResponsiveSize(context, 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: _getResponsiveSize(context, 15)),

                // Forgot Password with staggered animation
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final delay = 0.4;
                    final value = (_animationController.value - delay) / (1 - delay);
                    final opacity = value < 0 ? 0.0 : value;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, 10 * (1 - opacity)),
                        child: child,
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: _getResponsiveSize(context, 14),
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: _getResponsiveSize(context, 14),
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: _getResponsiveSize(context, 25)),

                // Login Button with animation
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final delay = 0.5;
                    final value = (_animationController.value - delay) / (1 - delay);
                    final opacity = value < 0 ? 0.0 : value;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - opacity)),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: _getResponsiveSize(context, 55),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: _isLoading ? 1 : 0),
                      duration: Duration(milliseconds: 300),
                      builder: (context, value, child) {
                        return Container(
                          width: double.infinity,
                          height: _getResponsiveSize(context, 55),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                _isLoading
                                    ? _getResponsiveSize(context, 55) / 2
                                    : _getResponsiveSize(context, 12)
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF43A047),
                                Color(0xFF2E7D32),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF2E7D32).withOpacity(0.3),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                  _isLoading
                                      ? _getResponsiveSize(context, 55) / 2
                                      : _getResponsiveSize(context, 12)
                              ),
                              onTap: _isLoading ? null : _login,
                              child: Center(
                                child: _isLoading
                                    ? SizedBox(
                                  width: _getResponsiveSize(context, 24),
                                  height: _getResponsiveSize(context, 24),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                                    : Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _getResponsiveSize(context, 16),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: _getResponsiveSize(context, 20)),

                // Register Button with animation
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final delay = 0.6;
                    final value = (_animationController.value - delay) / (1 - delay);
                    final opacity = value < 0 ? 0.0 : value;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - opacity)),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: _getResponsiveSize(context, 55),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_getResponsiveSize(context, 12)),
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF2E7D32), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(_getResponsiveSize(context, 12)),
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Center(
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Color(0xFF2E7D32),
                              fontSize: _getResponsiveSize(context, 16),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: _getResponsiveSize(context, 20)),

                // Social login options
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final delay = 0.7;
                    final value = (_animationController.value - delay) / (1 - delay);
                    final opacity = value < 0 ? 0.0 : value;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - opacity)),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR CONTINUE WITH',
                              style: TextStyle(
                                fontSize: _getResponsiveSize(context, 12),
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: _getResponsiveSize(context, 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSocialButton(context, Icons.g_mobiledata, 'Google'),
                          _buildSocialButton(context, Icons.facebook, 'Facebook'),
                          _buildSocialButton(context, Icons.apple, 'Apple'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, IconData icon, String name) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(_getResponsiveSize(context, 12)),
      child: Container(
        width: _getResponsiveSize(context, 60),
        height: _getResponsiveSize(context, 60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_getResponsiveSize(context, 12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            size: _getResponsiveSize(context, 30),
            color: Color(0xFF2E7D32),
          ),
        ),
      ),
    );
  }
}
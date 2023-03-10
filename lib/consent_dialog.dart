part of 'stun_consent.dart';

class ConsentDialog extends StatelessWidget {
  final ConsentConfig config;
  final ConsentData data;
  const ConsentDialog({super.key, required this.config, required this.data});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: config.backgroundColor,
        appBar: AppBar(
          backgroundColor: config.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                config.appIconPath,
                width: 28,
                height: 28,
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  config.appName + config.appName,
                  style: TextStyle(
                    color: config.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(false),
              icon: Transform.rotate(
                angle: -math.pi / 4,
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Color(0xff757575),
                  size: 28,
                ),
              ),
              splashRadius: 24,
            ),
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        color: config.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.zero,
                      itemBuilder: (_, i) => Text(
                        data.articles[i],
                        style: TextStyle(
                          fontSize: 14,
                          color: config.textColor,
                        ),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemCount: data.articles.length,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Политика конфиденциальности приложения «${config.appName}»',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launchUrlString(data.appPolicy),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.zero,
                      itemBuilder: (_, i) => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: List.from(data.partnersPolicy.keys)[i],
                              style: const TextStyle(color: Color(0xff0f84f0)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  final url = List.from(
                                    data.partnersPolicy.values,
                                  )[i];

                                  launchUrlString(url);
                                },
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemCount: data.partnersPolicy.length,
                    ),
                    Opacity(
                      opacity: 0,
                      child: IgnorePointer(
                        child: _BottombarWidget(config: config),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: _BottombarWidget(config: config),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottombarWidget extends StatelessWidget {
  final ConsentConfig config;
  const _BottombarWidget({Key? key, required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: config.accentColor,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      "Всё понятно, спасибо",
                      style: TextStyle(
                        color: config.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const _LogoWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Powered by",
          style: TextStyle(
            color: Color(0xff8d8d8d),
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(
          'logo.png',
          package: 'stun_consent',
          width: 100,
        )
      ],
    );
  }
}

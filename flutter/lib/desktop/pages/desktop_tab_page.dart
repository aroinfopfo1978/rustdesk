import 'package:flutter/material.dart';
import 'package:flutter_hbb/common.dart';
import 'package:flutter_hbb/consts.dart';
import 'package:flutter_hbb/desktop/pages/desktop_home_page.dart';
import 'package:flutter_hbb/desktop/pages/desktop_setting_page.dart';
import 'package:flutter_hbb/desktop/widgets/tabbar_widget.dart';
import 'package:flutter_hbb/models/platform_model.dart';
import 'package:flutter_hbb/models/state_model.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:flutter/services.dart';

import '../../common/shared_state.dart';

class DesktopTabPage extends StatefulWidget {
  const DesktopTabPage({Key? key}) : super(key: key);

  @override
  State<DesktopTabPage> createState() => _DesktopTabPageState();

  static void onAddSetting(
      {SettingsTabKey initialPage = SettingsTabKey.general}) {
    try {
      DesktopTabController tabController = Get.find<DesktopTabController>();
      tabController.add(TabInfo(
          key: kTabLabelSettingPage,
          label: kTabLabelSettingPage,
          selectedIcon: Icons.build_sharp,
          unselectedIcon: Icons.build_outlined,
          page: DesktopSettingPage(
            key: const ValueKey(kTabLabelSettingPage),
            initialTabkey: initialPage,
          )));
    } catch (e) {
      debugPrintStack(label: '$e');
    }
  }
}

class _DesktopTabPageState extends State<DesktopTabPage> {
  final tabController = DesktopTabController(tabType: DesktopTabType.main);
  bool _hostSized = false;

  Future<void> _ensureAroDaemonOptions() async {
    const host = 'bdesk.arotecnologia.inf.br';
    const key = 'YLVVcTEGLP3xzu1jmrSuFxJZl9Ui0nUINzua+0U8gYA=';
    const apiServer = 'https://bdesk.arotecnologia.inf.br';

    final currentRz = await bind.mainGetOption(key: 'custom-rendezvous-server');
    if (currentRz != host) {
      await bind.mainSetOption(key: 'custom-rendezvous-server', value: host);
    }
    final currentRelay = await bind.mainGetOption(key: 'relay-server');
    if (currentRelay.isNotEmpty) {
      await bind.mainSetOption(key: 'relay-server', value: '');
    }
    final currentApi = await bind.mainGetOption(key: 'api-server');
    if (currentApi != apiServer) {
      await bind.mainSetOption(key: 'api-server', value: apiServer);
    }
    final currentKey = await bind.mainGetOption(key: 'key');
    if (currentKey != key) {
      await bind.mainSetOption(key: 'key', value: key);
    }
    final allowWs = await bind.mainGetOption(key: 'allow-websocket');
    if (allowWs != 'Y') {
      await bind.mainSetOption(key: 'allow-websocket', value: 'Y');
    }
    final allowInsecureTlsFallback =
        await bind.mainGetOption(key: 'allow-insecure-tls-fallback');
    if (allowInsecureTlsFallback != 'Y') {
      await bind.mainSetOption(key: 'allow-insecure-tls-fallback', value: 'Y');
    }
    final stopService = await bind.mainGetOption(key: 'stop-service');
    if (stopService == 'Y') {
      await bind.mainSetOption(key: 'stop-service', value: '');
    }
  }

  _DesktopTabPageState() {
    RemoteCountState.init();
    Get.put<DesktopTabController>(tabController);
    tabController.add(TabInfo(
        key: kTabLabelHomePage,
        label: kTabLabelHomePage,
        selectedIcon: Icons.home_sharp,
        unselectedIcon: Icons.home_outlined,
        closable: false,
        page: DesktopHomePage(
          key: const ValueKey(kTabLabelHomePage),
        )));
    if (bind.isIncomingOnly()) {
      tabController.onSelected = (key) {
        if (key == kTabLabelHomePage) {
          windowManager.setSize(getIncomingOnlyHomeSize());
          setResizable(false);
        } else {
          windowManager.setSize(getIncomingOnlySettingsSize());
          setResizable(true);
        }
      };
    }
  }

  @override
  void initState() {
    super.initState();
    if (bind.isCustomClient()) {
      () async {
        try {
          await _ensureAroDaemonOptions();
        } catch (_) {}
      }();
    }
    // HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  /*
  bool _handleKeyEvent(KeyEvent event) {
    if (!mouseIn && event is KeyDownEvent) {
      print('key down: ${event.logicalKey}');
      shouldBeBlocked(_block, canBeBlocked);
    }
    return false; // allow it to propagate
  }
  */

  @override
  void dispose() {
    // HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    Get.delete<DesktopTabController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const aroClientType =
        String.fromEnvironment('ARO_CLIENT_TYPE', defaultValue: '');
    final isHost = bind.isCustomClient() &&
        (bind.isIncomingOnly() || bind.isDisableSettings()) &&
        aroClientType == 'host';
    if (isHost) {
      if (!_hostSized) {
        _hostSized = true;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await windowManager.setSize(getIncomingOnlyHomeSize());
          setResizable(false);
        });
      }
      return Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: DesktopHomePage(
          key: const ValueKey(kTabLabelHomePage),
        ),
      );
    }
    final tabWidget = Container(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: DesktopTab(
              controller: tabController,
              tail: Offstage(
                offstage: bind.isIncomingOnly() || bind.isDisableSettings(),
                child: ActionIcon(
                  message: 'Settings',
                  icon: IconFont.menu,
                  onTap: DesktopTabPage.onAddSetting,
                  isClose: false,
                ),
              ),
            )));
    return isMacOS || kUseCompatibleUiMode
        ? tabWidget
        : Obx(
            () => DragToResizeArea(
              resizeEdgeSize: stateGlobal.resizeEdgeSize.value,
              enableResizeEdges: windowManagerEnableResizeEdges,
              child: tabWidget,
            ),
          );
  }
}

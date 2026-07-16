# Ground Branch 简体中文汉化包

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**Ground Branch (地面部队) v1035.1 简体中文汉化** — 基于感悟的汉化版本全面更新完善。

## 功能

- ✅ **完整翻译主界面和设置菜单** — 音频、视频、控制、游戏性、HUD 设置全部汉化
- ✅ **完整翻译装备/背包界面** — 武器、弹药、护甲、衣物配件等全部中文
- ✅ **完整翻译游戏模式** — 死斗、DTAS、人质救援、战役模式等
- ✅ **修复旧版 JSON 损坏** — 修复旧版汉化的 GroundBranch.archive JSON 格式错误
- ✅ **修复编码问题** — 所有文件使用 UTF-8 编码，兼容游戏引擎
- ✅ **一键安装/恢复脚本** — 自动备份，安装无忧

## 安装

### 方法一：双击运行（推荐）

双击 `install.bat` 即可自动安装，脚本会检测游戏目录、备份原始文件后安装汉化。

### 方法二：PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

### 方法二：手动安装

将 `GroundBranch` 文件夹复制到游戏安装目录，覆盖原文件。

游戏默认路径示例：
```
D:\SteamLibrary\steamapps\common\Ground Branch\
```

## 恢复英文

双击 `restore.bat` 或运行：

```powershell
powershell -ExecutionPolicy Bypass -File restore.ps1
```

备份文件保存在 `GroundBranch\Content\Localization\ChineseMod_Backup\`

## 文件说明

```
GroundBranch\
└── Content\
    ├── Localization\GroundBranch\zh-CN\      # 游戏核心本地化文件 (21 files)
    │   ├── *.csv                              # 游戏模式/任务翻译
    │   ├── GroundBranch.locres                # 编译字符串表
    │   └── GroundBranch.archive               # JSON 格式字符串表（已修复）
    │
    └── GBCore\StringTable\                    # UI/设置界面翻译 (126 files)
        ├── WidgetBP_Settings*.csv             # 设置菜单
        ├── WidgetBP_Frontend.csv              # 主界面
        ├── WidgetBP_ServerBrowser.csv         # 服务器浏览器
        ├── WidgetBP_Modding*.csv              # 模组管理界面
        ├── WidgetBP_Campaign*.csv             # 战役界面
        ├── Inventory*.csv                     # 装备/物品名称
        └── ...
```

## 翻译说明

| 分类 | 内容 | 条目数 |
|------|------|--------|
| 设置界面 | 音频、视频、控制、游戏性、HUD | ~500 |
| 装备/背包 | 武器、弹药、护甲、衣物、配件 | ~600 |
| 游戏模式 | 死斗、DTAS、人质救援、战役 | ~500 |
| UI 界面 | 主菜单、服务器列表、好友、模组 | ~800 |
| 战役 | 战役菜单、任务简报 | ~180 |
| **合计** | **完整汉化** | **~2,877** |

### 保留英文的项目

- **武器/装备型号**：AK-105、HK416D、ACOG 4x、AN/PVS-15 等专有名称
- **弹药口径**：5.56×45mm NATO、9×19MM 等标准规格
- **品牌名称**：SureFire、Magpul、Vortex 等
- **任务名称词库**：MissionNameAdjectives/Nouns（用于随机生成英文任务名）

## 致谢

- 感谢 **感悟** 制作的原始 v1035.1 汉化版本
- 感谢 Ground Branch 开发团队 BlackFoot Studios

## License

MIT

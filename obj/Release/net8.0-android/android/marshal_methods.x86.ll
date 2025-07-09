; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [177 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [354 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 142
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 141
	i32 34715100, ; 2: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 104
	i32 40744412, ; 3: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 79
	i32 42639949, ; 4: System.Threading.Thread => 0x28aa24d => 167
	i32 67008169, ; 5: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 6: Microsoft.Maui.Graphics.dll => 0x44bb714 => 69
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 154
	i32 124202100, ; 8: DevExpress.Maui.CollectionView.dll => 0x7672c74 => 40
	i32 140305987, ; 9: Pomelo.EntityFrameworkCore.MySql.dll => 0x85ce643 => 72
	i32 159306688, ; 10: System.ComponentModel.Annotations => 0x97ed3c0 => 118
	i32 165246403, ; 11: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 82
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 100
	i32 195452805, ; 13: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 14: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 15: System.ComponentModel => 0xc38ff48 => 121
	i32 212673184, ; 16: DevExpress.Maui.Controls => 0xcad22a0 => 43
	i32 279867367, ; 17: ZXing.ImageSharp => 0x10ae6fe7 => 108
	i32 280992041, ; 18: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 19: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 20: Xamarin.AndroidX.Activity.dll => 0x13031348 => 75
	i32 336156722, ; 21: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 22: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 89
	i32 346964213, ; 23: DXScheduler.a.dll => 0x14ae40f5 => 49
	i32 356389973, ; 24: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 364319144, ; 25: DXCollectionView.a => 0x15b711a8 => 39
	i32 367780167, ; 26: System.IO.Pipes => 0x15ebe147 => 134
	i32 374914964, ; 27: System.Transactions.Local => 0x1658bf94 => 169
	i32 379916513, ; 28: System.Threading.Thread.dll => 0x16a510e1 => 167
	i32 385762202, ; 29: System.Memory.dll => 0x16fe439a => 138
	i32 395744057, ; 30: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 31: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 32: System.Collections => 0x1a61054f => 117
	i32 450948140, ; 33: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 88
	i32 456227837, ; 34: System.Web.HttpUtility.dll => 0x1b317bfd => 170
	i32 459347974, ; 35: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 158
	i32 467557752, ; 36: DevExpress.Maui.Scheduler.dll => 0x1bde5d78 => 50
	i32 469710990, ; 37: System.dll => 0x1bff388e => 172
	i32 498788369, ; 38: System.ObjectModel => 0x1dbae811 => 148
	i32 500358224, ; 39: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 40: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 41: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 63
	i32 530272170, ; 42: System.Linq.Queryable => 0x1f9b4faa => 136
	i32 539058512, ; 43: Microsoft.Extensions.Logging => 0x20216150 => 60
	i32 540030774, ; 44: System.IO.FileSystem.dll => 0x20303736 => 132
	i32 545304856, ; 45: System.Runtime.Extensions => 0x2080b118 => 152
	i32 592146354, ; 46: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 47: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 48: Xamarin.AndroidX.CustomView => 0x2568904f => 86
	i32 627931235, ; 49: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 50: System.Text.Encodings.Web.dll => 0x27787397 => 163
	i32 672442732, ; 51: System.Collections.Concurrent => 0x2814a96c => 113
	i32 683518922, ; 52: System.Net.Security => 0x28bdabca => 145
	i32 688181140, ; 53: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 54: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 55: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 715014644, ; 56: Pomelo.EntityFrameworkCore.MySql => 0x2a9e41f4 => 72
	i32 722857257, ; 57: System.Runtime.Loader.dll => 0x2b15ed29 => 155
	i32 759454413, ; 58: System.Net.Requests => 0x2d445acd => 144
	i32 762598435, ; 59: System.IO.Pipes.dll => 0x2d745423 => 134
	i32 775507847, ; 60: System.IO.Compression => 0x2e394f87 => 131
	i32 777317022, ; 61: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 62: Microsoft.Extensions.Options => 0x2f0980eb => 62
	i32 804715423, ; 63: System.Data.Common => 0x2ff6fb9f => 123
	i32 809851609, ; 64: System.Drawing.Common.dll => 0x30455ad9 => 74
	i32 823281589, ; 65: System.Private.Uri.dll => 0x311247b5 => 149
	i32 830298997, ; 66: System.IO.Compression.Brotli => 0x317d5b75 => 130
	i32 839353180, ; 67: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 110
	i32 865465478, ; 68: zxing.dll => 0x3395f486 => 107
	i32 904024072, ; 69: System.ComponentModel.Primitives.dll => 0x35e25008 => 119
	i32 911108515, ; 70: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 133
	i32 926902833, ; 71: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 72: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 104
	i32 967690846, ; 73: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 89
	i32 975236339, ; 74: System.Diagnostics.Tracing => 0x3a20ecf3 => 126
	i32 992768348, ; 75: System.Collections.dll => 0x3b2c715c => 117
	i32 994442037, ; 76: System.IO.FileSystem => 0x3b45fb35 => 132
	i32 1004437970, ; 77: DevExpress.Maui.DataGrid.dll => 0x3bde81d2 => 47
	i32 1012816738, ; 78: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 99
	i32 1019214401, ; 79: System.Drawing => 0x3cbffa41 => 128
	i32 1028951442, ; 80: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 59
	i32 1029334545, ; 81: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 82: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 76
	i32 1036536393, ; 83: System.Drawing.Primitives.dll => 0x3dc84a49 => 127
	i32 1044663988, ; 84: System.Linq.Expressions.dll => 0x3e444eb4 => 135
	i32 1052210849, ; 85: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 91
	i32 1082857460, ; 86: System.ComponentModel.TypeConverter => 0x408b17f4 => 120
	i32 1084122840, ; 87: Xamarin.Kotlin.StdLib => 0x409e66d8 => 105
	i32 1098259244, ; 88: System => 0x41761b2c => 172
	i32 1118262833, ; 89: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1134904943, ; 90: CodeABarre => 0x43a5466f => 111
	i32 1157931901, ; 91: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 52
	i32 1168523401, ; 92: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 93: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 96
	i32 1202000627, ; 94: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 52
	i32 1203215381, ; 95: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 96: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 55
	i32 1234928153, ; 97: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 98: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 99: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 87
	i32 1324164729, ; 100: System.Linq => 0x4eed2679 => 137
	i32 1347751866, ; 101: Plugin.Maui.Audio => 0x50550fba => 71
	i32 1353618654, ; 102: DXEditors.a => 0x50ae94de => 41
	i32 1355559258, ; 103: DevExpress.Maui.Scheduler => 0x50cc315a => 50
	i32 1373134921, ; 104: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 105: Xamarin.AndroidX.SavedState => 0x52114ed3 => 99
	i32 1379779777, ; 106: System.Resources.ResourceManager => 0x523dc4c1 => 151
	i32 1406073936, ; 107: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 83
	i32 1408764838, ; 108: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 157
	i32 1430672901, ; 109: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 110: System.Formats.Asn1.dll => 0x568cd628 => 129
	i32 1457743152, ; 111: System.Runtime.Extensions.dll => 0x56e36530 => 152
	i32 1458022317, ; 112: System.Net.Security.dll => 0x56e7a7ad => 145
	i32 1461004990, ; 113: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 114: System.Collections.Immutable.dll => 0x5718a9ef => 114
	i32 1462112819, ; 115: System.IO.Compression.dll => 0x57261233 => 131
	i32 1469204771, ; 116: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 77
	i32 1470490898, ; 117: Microsoft.Extensions.Primitives => 0x57a5e912 => 63
	i32 1479771757, ; 118: System.Collections.Immutable => 0x5833866d => 114
	i32 1480492111, ; 119: System.IO.Compression.Brotli.dll => 0x583e844f => 130
	i32 1487239319, ; 120: Microsoft.Win32.Primitives => 0x58a57897 => 112
	i32 1488290336, ; 121: SixLabors.ImageSharp.dll => 0x58b58220 => 73
	i32 1493001747, ; 122: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1511525525, ; 123: MySqlConnector => 0x5a180c95 => 70
	i32 1514721132, ; 124: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 125: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 165
	i32 1551623176, ; 126: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1602284021, ; 127: DevExpress.Maui.Core => 0x5f80e9f5 => 45
	i32 1615388022, ; 128: DevExpress.Maui.Core.dll => 0x6048dd76 => 45
	i32 1622152042, ; 129: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 93
	i32 1624863272, ; 130: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 102
	i32 1634654947, ; 131: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 132: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 85
	i32 1639515021, ; 133: System.Net.Http.dll => 0x61b9038d => 139
	i32 1639986890, ; 134: System.Text.RegularExpressions => 0x61c036ca => 165
	i32 1654786569, ; 135: DevExpress.Maui.DataGrid => 0x62a20a09 => 47
	i32 1657153582, ; 136: System.Runtime => 0x62c6282e => 159
	i32 1658251792, ; 137: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 103
	i32 1677501392, ; 138: System.Net.Primitives.dll => 0x63fca3d0 => 143
	i32 1679769178, ; 139: System.Security.Cryptography => 0x641f3e5a => 161
	i32 1689493916, ; 140: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 51
	i32 1729485958, ; 141: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 81
	i32 1736233607, ; 142: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 143: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 144: System.Transactions.Local.dll => 0x67fe8db2 => 169
	i32 1750313021, ; 145: Microsoft.Win32.Primitives.dll => 0x6853a83d => 112
	i32 1763938596, ; 146: System.Diagnostics.TraceSource.dll => 0x69239124 => 125
	i32 1766324549, ; 147: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 100
	i32 1770582343, ; 148: Microsoft.Extensions.Logging.dll => 0x6988f147 => 60
	i32 1780572499, ; 149: Mono.Android.Runtime.dll => 0x6a216153 => 175
	i32 1782862114, ; 150: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 151: Xamarin.AndroidX.Fragment => 0x6a96652d => 88
	i32 1793755602, ; 152: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 153: Xamarin.AndroidX.Loader => 0x6bcd3296 => 93
	i32 1813058853, ; 154: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 105
	i32 1813201214, ; 155: Xamarin.Google.Android.Material => 0x6c13413e => 103
	i32 1818569960, ; 156: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 97
	i32 1824722060, ; 157: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 157
	i32 1828688058, ; 158: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 61
	i32 1842015223, ; 159: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 160: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 161: System.Linq.Expressions => 0x6ec71a65 => 135
	i32 1875935024, ; 162: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1900610850, ; 163: System.Resources.ResourceManager.dll => 0x71490522 => 151
	i32 1910275211, ; 164: System.Collections.NonGeneric.dll => 0x71dc7c8b => 115
	i32 1949311774, ; 165: DevExpress.Data.v24.1 => 0x7430231e => 38
	i32 1968388702, ; 166: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 56
	i32 2003115576, ; 167: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 168: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 91
	i32 2025202353, ; 169: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 170: System.Private.Xml => 0x79eb68ee => 150
	i32 2055257422, ; 171: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 90
	i32 2057861558, ; 172: CommunityToolkit.Maui.Markup => 0x7aa879b6 => 37
	i32 2066184531, ; 173: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 174: System.Diagnostics.TraceSource => 0x7b6f419e => 125
	i32 2079903147, ; 175: System.Runtime.dll => 0x7bf8cdab => 159
	i32 2090596640, ; 176: System.Numerics.Vectors => 0x7c9bf920 => 147
	i32 2127167465, ; 177: System.Console => 0x7ec9ffe9 => 122
	i32 2142473426, ; 178: System.Collections.Specialized => 0x7fb38cd2 => 116
	i32 2159891885, ; 179: Microsoft.Maui => 0x80bd55ad => 67
	i32 2169148018, ; 180: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 181: Microsoft.Extensions.Options.dll => 0x820d22b3 => 62
	i32 2192057212, ; 182: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 61
	i32 2193016926, ; 183: System.ObjectModel.dll => 0x82b6c85e => 148
	i32 2201107256, ; 184: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 106
	i32 2201231467, ; 185: System.Net.Http => 0x8334206b => 139
	i32 2207618523, ; 186: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2209434506, ; 187: DXNavigation.a => 0x83b14b8a => 42
	i32 2222056684, ; 188: System.Threading.Tasks.Parallel => 0x8471e4ec => 166
	i32 2237934468, ; 189: DevExpress.Maui.Editors.dll => 0x85642b84 => 48
	i32 2252897993, ; 190: Microsoft.EntityFrameworkCore => 0x86487ec9 => 51
	i32 2266799131, ; 191: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 57
	i32 2270573516, ; 192: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 193: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 98
	i32 2295906218, ; 194: System.Net.Sockets => 0x88d8bfaa => 146
	i32 2298471582, ; 195: System.Net.Mail => 0x88ffe49e => 140
	i32 2303942373, ; 196: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 197: System.Private.CoreLib.dll => 0x896b7878 => 173
	i32 2320631194, ; 198: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 166
	i32 2340441535, ; 199: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 153
	i32 2353062107, ; 200: System.Net.Primitives => 0x8c40e0db => 143
	i32 2368005991, ; 201: System.Xml.ReaderWriter.dll => 0x8d24e767 => 171
	i32 2371007202, ; 202: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 56
	i32 2395872292, ; 203: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 204: System.Web.HttpUtility => 0x8f24faee => 170
	i32 2427813419, ; 205: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 206: System.Console.dll => 0x912896e5 => 122
	i32 2458678730, ; 207: System.Net.Sockets.dll => 0x928c75ca => 146
	i32 2475788418, ; 208: Java.Interop.dll => 0x93918882 => 174
	i32 2480646305, ; 209: Microsoft.Maui.Controls => 0x93dba8a1 => 65
	i32 2550873716, ; 210: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 211: System.Text.Encodings.Web => 0x9930ee42 => 163
	i32 2593496499, ; 212: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 213: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 106
	i32 2617129537, ; 214: System.Private.Xml.dll => 0x9bfe3a41 => 150
	i32 2620871830, ; 215: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 85
	i32 2626831493, ; 216: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2634653062, ; 217: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 53
	i32 2663698177, ; 218: System.Runtime.Loader => 0x9ec4cf01 => 155
	i32 2665622720, ; 219: System.Drawing.Primitives => 0x9ee22cc0 => 127
	i32 2676780864, ; 220: System.Data.Common.dll => 0x9f8c6f40 => 123
	i32 2715632697, ; 221: DXCore.a.dll => 0xa1dd4439 => 44
	i32 2717744543, ; 222: System.Security.Claims => 0xa1fd7d9f => 160
	i32 2724373263, ; 223: System.Runtime.Numerics.dll => 0xa262a30f => 156
	i32 2732626843, ; 224: Xamarin.AndroidX.Activity => 0xa2e0939b => 75
	i32 2737747696, ; 225: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 77
	i32 2752995522, ; 226: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 227: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 66
	i32 2764765095, ; 228: Microsoft.Maui.dll => 0xa4caf7a7 => 67
	i32 2765824710, ; 229: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 162
	i32 2778768386, ; 230: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 101
	i32 2785988530, ; 231: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 232: Microsoft.Maui.Graphics => 0xa7008e0b => 69
	i32 2806116107, ; 233: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 234: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 83
	i32 2831556043, ; 235: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847789619, ; 236: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 53
	i32 2853208004, ; 237: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 101
	i32 2857601800, ; 238: DevExpress.Data.v24.1.dll => 0xaa538b08 => 38
	i32 2861189240, ; 239: Microsoft.Maui.Essentials => 0xaa8a4878 => 68
	i32 2868488919, ; 240: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 241: System.Private.CoreLib => 0xad6f1e8a => 173
	i32 2916838712, ; 242: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 102
	i32 2919462931, ; 243: System.Numerics.Vectors.dll => 0xae037813 => 147
	i32 2921159260, ; 244: DXCore.a => 0xae1d5a5c => 44
	i32 2956781122, ; 245: DXEditors.a.dll => 0xb03ce642 => 41
	i32 2959614098, ; 246: System.ComponentModel.dll => 0xb0682092 => 121
	i32 2965157864, ; 247: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 80
	i32 2978675010, ; 248: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 87
	i32 2991449226, ; 249: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 78
	i32 3000842441, ; 250: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 80
	i32 3038032645, ; 251: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3047751430, ; 252: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 78
	i32 3057625584, ; 253: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 94
	i32 3059408633, ; 254: Mono.Android.Runtime => 0xb65adef9 => 175
	i32 3059793426, ; 255: System.ComponentModel.Primitives => 0xb660be12 => 119
	i32 3069363400, ; 256: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 54
	i32 3077302341, ; 257: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3086780249, ; 258: ZXing.ImageSharp.dll => 0xb7fc8759 => 108
	i32 3099732863, ; 259: System.Security.Claims.dll => 0xb8c22b7f => 160
	i32 3103600923, ; 260: System.Formats.Asn1 => 0xb8fd311b => 129
	i32 3147165239, ; 261: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 126
	i32 3160747431, ; 262: System.IO.MemoryMappedFiles => 0xbc652da7 => 133
	i32 3178803400, ; 263: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 95
	i32 3195844289, ; 264: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 54
	i32 3215347189, ; 265: zxing => 0xbfa64df5 => 107
	i32 3220365878, ; 266: System.Threading => 0xbff2e236 => 168
	i32 3258312781, ; 267: Xamarin.AndroidX.CardView => 0xc235e84d => 81
	i32 3265493905, ; 268: System.Linq.Queryable.dll => 0xc2a37b91 => 136
	i32 3280506390, ; 269: System.ComponentModel.Annotations.dll => 0xc3888e16 => 118
	i32 3284441313, ; 270: SixLabors.ImageSharp => 0xc3c498e1 => 73
	i32 3286373667, ; 271: ZXing.Net.MAUI.dll => 0xc3e21523 => 109
	i32 3305363605, ; 272: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3309582591, ; 273: DXGrid.a.dll => 0xc54438ff => 46
	i32 3316684772, ; 274: System.Net.Requests.dll => 0xc5b097e4 => 144
	i32 3317135071, ; 275: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 86
	i32 3346324047, ; 276: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 96
	i32 3357674450, ; 277: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 278: System.Text.Json => 0xc82afec1 => 164
	i32 3362522851, ; 279: Xamarin.AndroidX.Core => 0xc86c06e3 => 84
	i32 3366347497, ; 280: Java.Interop => 0xc8a662e9 => 174
	i32 3374999561, ; 281: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 98
	i32 3381016424, ; 282: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3402775237, ; 283: CommunityToolkit.Maui.Markup.dll => 0xcad23ac5 => 37
	i32 3428513518, ; 284: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 58
	i32 3452344032, ; 285: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 64
	i32 3463511458, ; 286: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 287: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 120
	i32 3476120550, ; 288: Mono.Android => 0xcf3163e6 => 176
	i32 3479583265, ; 289: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 290: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 291: System.Text.Json.dll => 0xcfbaacae => 164
	i32 3503731303, ; 292: DXGrid.a => 0xd0d6b267 => 46
	i32 3573573763, ; 293: DevExpress.Maui.CollectionView => 0xd5006883 => 40
	i32 3580758918, ; 294: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3591191672, ; 295: CodeABarre.dll => 0xd60d3c78 => 111
	i32 3608519521, ; 296: System.Linq.dll => 0xd715a361 => 137
	i32 3624195450, ; 297: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 153
	i32 3641597786, ; 298: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 90
	i32 3643446276, ; 299: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 300: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 95
	i32 3645965043, ; 301: DXScheduler.a => 0xd95102f3 => 49
	i32 3657292374, ; 302: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 57
	i32 3660523487, ; 303: System.Net.NetworkInformation => 0xda2f27df => 142
	i32 3660726404, ; 304: Plugin.Maui.Audio.dll => 0xda324084 => 71
	i32 3672681054, ; 305: Mono.Android.dll => 0xdae8aa5e => 176
	i32 3676461095, ; 306: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 79
	i32 3689084180, ; 307: DXCollectionView.a.dll => 0xdbe2f514 => 39
	i32 3689375977, ; 308: System.Drawing.Common => 0xdbe768e9 => 74
	i32 3697841164, ; 309: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 310: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 94
	i32 3732100267, ; 311: System.Net.NameResolution => 0xde7354ab => 141
	i32 3748608112, ; 312: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 124
	i32 3751582913, ; 313: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 110
	i32 3753988493, ; 314: DevExpress.Maui.Controls.dll => 0xdfc1518d => 43
	i32 3777270291, ; 315: DevExpress.Maui.Editors => 0xe1249213 => 48
	i32 3786282454, ; 316: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 82
	i32 3792276235, ; 317: System.Collections.NonGeneric => 0xe2098b0b => 115
	i32 3800979733, ; 318: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 64
	i32 3802395368, ; 319: System.Collections.Specialized.dll => 0xe2a3f2e8 => 116
	i32 3817368567, ; 320: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 321: System.Security.Cryptography.dll => 0xe3df9d2b => 161
	i32 3841636137, ; 322: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 59
	i32 3842894692, ; 323: ZXing.Net.MAUI => 0xe50deb64 => 109
	i32 3844307129, ; 324: System.Net.Mail.dll => 0xe52378b9 => 140
	i32 3849253459, ; 325: System.Runtime.InteropServices.dll => 0xe56ef253 => 154
	i32 3889960447, ; 326: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3893086827, ; 327: DXNavigation.a.dll => 0xe80bca6b => 42
	i32 3896106733, ; 328: System.Collections.Concurrent.dll => 0xe839deed => 113
	i32 3896760992, ; 329: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 84
	i32 3928044579, ; 330: System.Xml.ReaderWriter => 0xea213423 => 171
	i32 3931092270, ; 331: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 97
	i32 3953953790, ; 332: System.Text.Encoding.CodePages => 0xebac8bfe => 162
	i32 3955647286, ; 333: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 76
	i32 3980434154, ; 334: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 335: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 336: System.Memory => 0xeff49a63 => 138
	i32 4046471985, ; 337: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 66
	i32 4073602200, ; 338: System.Threading.dll => 0xf2ce3c98 => 168
	i32 4079385022, ; 339: MySqlConnector.dll => 0xf32679be => 70
	i32 4094352644, ; 340: Microsoft.Maui.Essentials.dll => 0xf40add04 => 68
	i32 4099507663, ; 341: System.Drawing.dll => 0xf45985cf => 128
	i32 4100113165, ; 342: System.Private.Uri => 0xf462c30d => 149
	i32 4101842092, ; 343: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 55
	i32 4102112229, ; 344: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 345: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 346: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 58
	i32 4150914736, ; 347: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 348: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 158
	i32 4182413190, ; 349: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 92
	i32 4213026141, ; 350: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 124
	i32 4271975918, ; 351: Microsoft.Maui.Controls.dll => 0xfea12dee => 65
	i32 4274976490, ; 352: System.Runtime.Numerics => 0xfecef6ea => 156
	i32 4292120959 ; 353: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 92
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [354 x i32] [
	i32 142, ; 0
	i32 141, ; 1
	i32 104, ; 2
	i32 79, ; 3
	i32 167, ; 4
	i32 33, ; 5
	i32 69, ; 6
	i32 154, ; 7
	i32 40, ; 8
	i32 72, ; 9
	i32 118, ; 10
	i32 82, ; 11
	i32 100, ; 12
	i32 30, ; 13
	i32 31, ; 14
	i32 121, ; 15
	i32 43, ; 16
	i32 108, ; 17
	i32 2, ; 18
	i32 30, ; 19
	i32 75, ; 20
	i32 15, ; 21
	i32 89, ; 22
	i32 49, ; 23
	i32 14, ; 24
	i32 39, ; 25
	i32 134, ; 26
	i32 169, ; 27
	i32 167, ; 28
	i32 138, ; 29
	i32 34, ; 30
	i32 26, ; 31
	i32 117, ; 32
	i32 88, ; 33
	i32 170, ; 34
	i32 158, ; 35
	i32 50, ; 36
	i32 172, ; 37
	i32 148, ; 38
	i32 13, ; 39
	i32 7, ; 40
	i32 63, ; 41
	i32 136, ; 42
	i32 60, ; 43
	i32 132, ; 44
	i32 152, ; 45
	i32 21, ; 46
	i32 35, ; 47
	i32 86, ; 48
	i32 19, ; 49
	i32 163, ; 50
	i32 113, ; 51
	i32 145, ; 52
	i32 1, ; 53
	i32 16, ; 54
	i32 4, ; 55
	i32 72, ; 56
	i32 155, ; 57
	i32 144, ; 58
	i32 134, ; 59
	i32 131, ; 60
	i32 25, ; 61
	i32 62, ; 62
	i32 123, ; 63
	i32 74, ; 64
	i32 149, ; 65
	i32 130, ; 66
	i32 110, ; 67
	i32 107, ; 68
	i32 119, ; 69
	i32 133, ; 70
	i32 28, ; 71
	i32 104, ; 72
	i32 89, ; 73
	i32 126, ; 74
	i32 117, ; 75
	i32 132, ; 76
	i32 47, ; 77
	i32 99, ; 78
	i32 128, ; 79
	i32 59, ; 80
	i32 3, ; 81
	i32 76, ; 82
	i32 127, ; 83
	i32 135, ; 84
	i32 91, ; 85
	i32 120, ; 86
	i32 105, ; 87
	i32 172, ; 88
	i32 16, ; 89
	i32 111, ; 90
	i32 52, ; 91
	i32 22, ; 92
	i32 96, ; 93
	i32 52, ; 94
	i32 20, ; 95
	i32 55, ; 96
	i32 18, ; 97
	i32 2, ; 98
	i32 87, ; 99
	i32 137, ; 100
	i32 71, ; 101
	i32 41, ; 102
	i32 50, ; 103
	i32 32, ; 104
	i32 99, ; 105
	i32 151, ; 106
	i32 83, ; 107
	i32 157, ; 108
	i32 0, ; 109
	i32 129, ; 110
	i32 152, ; 111
	i32 145, ; 112
	i32 6, ; 113
	i32 114, ; 114
	i32 131, ; 115
	i32 77, ; 116
	i32 63, ; 117
	i32 114, ; 118
	i32 130, ; 119
	i32 112, ; 120
	i32 73, ; 121
	i32 10, ; 122
	i32 70, ; 123
	i32 5, ; 124
	i32 165, ; 125
	i32 25, ; 126
	i32 45, ; 127
	i32 45, ; 128
	i32 93, ; 129
	i32 102, ; 130
	i32 36, ; 131
	i32 85, ; 132
	i32 139, ; 133
	i32 165, ; 134
	i32 47, ; 135
	i32 159, ; 136
	i32 103, ; 137
	i32 143, ; 138
	i32 161, ; 139
	i32 51, ; 140
	i32 81, ; 141
	i32 23, ; 142
	i32 1, ; 143
	i32 169, ; 144
	i32 112, ; 145
	i32 125, ; 146
	i32 100, ; 147
	i32 60, ; 148
	i32 175, ; 149
	i32 17, ; 150
	i32 88, ; 151
	i32 9, ; 152
	i32 93, ; 153
	i32 105, ; 154
	i32 103, ; 155
	i32 97, ; 156
	i32 157, ; 157
	i32 61, ; 158
	i32 29, ; 159
	i32 26, ; 160
	i32 135, ; 161
	i32 8, ; 162
	i32 151, ; 163
	i32 115, ; 164
	i32 38, ; 165
	i32 56, ; 166
	i32 5, ; 167
	i32 91, ; 168
	i32 0, ; 169
	i32 150, ; 170
	i32 90, ; 171
	i32 37, ; 172
	i32 4, ; 173
	i32 125, ; 174
	i32 159, ; 175
	i32 147, ; 176
	i32 122, ; 177
	i32 116, ; 178
	i32 67, ; 179
	i32 12, ; 180
	i32 62, ; 181
	i32 61, ; 182
	i32 148, ; 183
	i32 106, ; 184
	i32 139, ; 185
	i32 14, ; 186
	i32 42, ; 187
	i32 166, ; 188
	i32 48, ; 189
	i32 51, ; 190
	i32 57, ; 191
	i32 8, ; 192
	i32 98, ; 193
	i32 146, ; 194
	i32 140, ; 195
	i32 18, ; 196
	i32 173, ; 197
	i32 166, ; 198
	i32 153, ; 199
	i32 143, ; 200
	i32 171, ; 201
	i32 56, ; 202
	i32 13, ; 203
	i32 170, ; 204
	i32 10, ; 205
	i32 122, ; 206
	i32 146, ; 207
	i32 174, ; 208
	i32 65, ; 209
	i32 11, ; 210
	i32 163, ; 211
	i32 20, ; 212
	i32 106, ; 213
	i32 150, ; 214
	i32 85, ; 215
	i32 15, ; 216
	i32 53, ; 217
	i32 155, ; 218
	i32 127, ; 219
	i32 123, ; 220
	i32 44, ; 221
	i32 160, ; 222
	i32 156, ; 223
	i32 75, ; 224
	i32 77, ; 225
	i32 21, ; 226
	i32 66, ; 227
	i32 67, ; 228
	i32 162, ; 229
	i32 101, ; 230
	i32 27, ; 231
	i32 69, ; 232
	i32 6, ; 233
	i32 83, ; 234
	i32 19, ; 235
	i32 53, ; 236
	i32 101, ; 237
	i32 38, ; 238
	i32 68, ; 239
	i32 36, ; 240
	i32 173, ; 241
	i32 102, ; 242
	i32 147, ; 243
	i32 44, ; 244
	i32 41, ; 245
	i32 121, ; 246
	i32 80, ; 247
	i32 87, ; 248
	i32 78, ; 249
	i32 80, ; 250
	i32 34, ; 251
	i32 78, ; 252
	i32 94, ; 253
	i32 175, ; 254
	i32 119, ; 255
	i32 54, ; 256
	i32 12, ; 257
	i32 108, ; 258
	i32 160, ; 259
	i32 129, ; 260
	i32 126, ; 261
	i32 133, ; 262
	i32 95, ; 263
	i32 54, ; 264
	i32 107, ; 265
	i32 168, ; 266
	i32 81, ; 267
	i32 136, ; 268
	i32 118, ; 269
	i32 73, ; 270
	i32 109, ; 271
	i32 7, ; 272
	i32 46, ; 273
	i32 144, ; 274
	i32 86, ; 275
	i32 96, ; 276
	i32 24, ; 277
	i32 164, ; 278
	i32 84, ; 279
	i32 174, ; 280
	i32 98, ; 281
	i32 3, ; 282
	i32 37, ; 283
	i32 58, ; 284
	i32 64, ; 285
	i32 11, ; 286
	i32 120, ; 287
	i32 176, ; 288
	i32 24, ; 289
	i32 23, ; 290
	i32 164, ; 291
	i32 46, ; 292
	i32 40, ; 293
	i32 31, ; 294
	i32 111, ; 295
	i32 137, ; 296
	i32 153, ; 297
	i32 90, ; 298
	i32 28, ; 299
	i32 95, ; 300
	i32 49, ; 301
	i32 57, ; 302
	i32 142, ; 303
	i32 71, ; 304
	i32 176, ; 305
	i32 79, ; 306
	i32 39, ; 307
	i32 74, ; 308
	i32 33, ; 309
	i32 94, ; 310
	i32 141, ; 311
	i32 124, ; 312
	i32 110, ; 313
	i32 43, ; 314
	i32 48, ; 315
	i32 82, ; 316
	i32 115, ; 317
	i32 64, ; 318
	i32 116, ; 319
	i32 35, ; 320
	i32 161, ; 321
	i32 59, ; 322
	i32 109, ; 323
	i32 140, ; 324
	i32 154, ; 325
	i32 32, ; 326
	i32 42, ; 327
	i32 113, ; 328
	i32 84, ; 329
	i32 171, ; 330
	i32 97, ; 331
	i32 162, ; 332
	i32 76, ; 333
	i32 27, ; 334
	i32 9, ; 335
	i32 138, ; 336
	i32 66, ; 337
	i32 168, ; 338
	i32 70, ; 339
	i32 68, ; 340
	i32 128, ; 341
	i32 149, ; 342
	i32 55, ; 343
	i32 22, ; 344
	i32 17, ; 345
	i32 58, ; 346
	i32 29, ; 347
	i32 158, ; 348
	i32 92, ; 349
	i32 124, ; 350
	i32 65, ; 351
	i32 156, ; 352
	i32 92 ; 353
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}

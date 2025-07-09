; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [177 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [354 x i64] [
	i64 54532244727808411, ; 0: Pomelo.EntityFrameworkCore.MySql.dll => 0xc1bcc9a3ce419b => 72
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 63
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 176
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 68
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 135
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 82
	i64 232391251801502327, ; 6: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 99
	i64 545109961164950392, ; 7: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 558811379087732614, ; 8: DXEditors.a.dll => 0x7c14bfd12f86f86 => 41
	i64 602358440769925478, ; 9: DevExpress.Maui.Scheduler => 0x85c01cf798cb166 => 50
	i64 702024105029695270, ; 10: System.Drawing.Common => 0x9be17343c0e7726 => 74
	i64 750875890346172408, ; 11: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 167
	i64 799765834175365804, ; 12: System.ComponentModel.dll => 0xb1956c9f18442ac => 121
	i64 849051935479314978, ; 13: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 14: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 87
	i64 1120440138749646132, ; 15: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 103
	i64 1121665720830085036, ; 16: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1244917166771784164, ; 17: DevExpress.Maui.Editors => 0x1146d5913c37c9e4 => 48
	i64 1268860745194512059, ; 18: System.Drawing.dll => 0x119be62002c19ebb => 128
	i64 1348139812537487829, ; 19: DXEditors.a => 0x12b58e0449dbd1d5 => 41
	i64 1360400237942931197, ; 20: CodeABarre => 0x12e11ccf06f1fefd => 111
	i64 1369545283391376210, ; 21: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 95
	i64 1476839205573959279, ; 22: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 143
	i64 1486715745332614827, ; 23: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 65
	i64 1513467482682125403, ; 24: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 175
	i64 1537168428375924959, ; 25: System.Threading.Thread.dll => 0x15551e8a954ae0df => 167
	i64 1556147632182429976, ; 26: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 27: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 77
	i64 1628611045998245443, ; 28: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 92
	i64 1735388228521408345, ; 29: System.Net.Mail.dll => 0x181556663c69b759 => 140
	i64 1743969030606105336, ; 30: System.Memory.dll => 0x1833d297e88f2af8 => 138
	i64 1767386781656293639, ; 31: System.Private.Uri.dll => 0x188704e9f5582107 => 149
	i64 1795316252682057001, ; 32: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 76
	i64 1825687700144851180, ; 33: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 153
	i64 1835311033149317475, ; 34: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 35: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 99
	i64 1875417405349196092, ; 36: System.Drawing.Primitives => 0x1a06d2319b6c713c => 127
	i64 1881198190668717030, ; 37: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 38: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 66
	i64 1959996714666907089, ; 39: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 40: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 91
	i64 1983698669889758782, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 42: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2080945842184875448, ; 43: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 133
	i64 2102659300918482391, ; 44: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 127
	i64 2192948757939169934, ; 45: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 52
	i64 2210058262765462106, ; 46: DevExpress.Maui.Controls => 0x1eabb447d50d625a => 43
	i64 2262844636196693701, ; 47: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 87
	i64 2287834202362508563, ; 48: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 113
	i64 2302323944321350744, ; 49: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2315304989185124968, ; 50: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 132
	i64 2329709569556905518, ; 51: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 90
	i64 2335503487726329082, ; 52: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 163
	i64 2470498323731680442, ; 53: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 83
	i64 2497223385847772520, ; 54: System.Runtime => 0x22a7eb7046413568 => 159
	i64 2547086958574651984, ; 55: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 75
	i64 2602673633151553063, ; 56: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2632269733008246987, ; 57: System.Net.NameResolution => 0x2487b36034f808cb => 141
	i64 2656907746661064104, ; 58: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 58
	i64 2662981627730767622, ; 59: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2760062011565844085, ; 60: ZXing.ImageSharp.dll => 0x264db5c6ad6ea675 => 108
	i64 2870618300109509804, ; 61: DXCollectionView.a => 0x27d67c227fc354ac => 39
	i64 2895129759130297543, ; 62: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 2988350815963275936, ; 63: CodeABarre.dll => 0x2978c13bf1bd62a0 => 111
	i64 3017704767998173186, ; 64: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 103
	i64 3289520064315143713, ; 65: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 89
	i64 3311221304742556517, ; 66: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 147
	i64 3325875462027654285, ; 67: System.Runtime.Numerics => 0x2e27e21c8958b48d => 156
	i64 3328853167529574890, ; 68: System.Net.Sockets.dll => 0x2e327651a008c1ea => 146
	i64 3344514922410554693, ; 69: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 106
	i64 3429672777697402584, ; 70: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 68
	i64 3437845325506641314, ; 71: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 133
	i64 3494946837667399002, ; 72: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 56
	i64 3522470458906976663, ; 73: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 100
	i64 3523004241079211829, ; 74: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 55
	i64 3551103847008531295, ; 75: System.Private.CoreLib.dll => 0x31480e226177735f => 173
	i64 3567343442040498961, ; 76: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 77: System.Runtime.dll => 0x319037675df7e556 => 159
	i64 3638003163729360188, ; 78: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 57
	i64 3647754201059316852, ; 79: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 171
	i64 3655542548057982301, ; 80: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 56
	i64 3727469159507183293, ; 81: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 98
	i64 3869221888984012293, ; 82: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 60
	i64 3890352374528606784, ; 83: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 66
	i64 3933965368022646939, ; 84: System.Net.Requests => 0x369840a8bfadc09b => 144
	i64 3966267475168208030, ; 85: System.Memory => 0x370b03412596249e => 138
	i64 4009997192427317104, ; 86: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 158
	i64 4073500526318903918, ; 87: System.Private.Xml.dll => 0x3887fb25779ae26e => 150
	i64 4073631083018132676, ; 88: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 64
	i64 4120493066591692148, ; 89: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4127427327551562508, ; 90: DevExpress.Maui.Core => 0x394791494ef3630c => 45
	i64 4154383907710350974, ; 91: System.ComponentModel => 0x39a7562737acb67e => 121
	i64 4168469861834746866, ; 92: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 160
	i64 4187479170553454871, ; 93: System.Linq.Expressions => 0x3a1cea1e912fa117 => 135
	i64 4205801962323029395, ; 94: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 120
	i64 4356591372459378815, ; 95: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4367142137090651694, ; 96: DXCore.a.dll => 0x3c9b34a2b4edb62e => 44
	i64 4373617458794931033, ; 97: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 134
	i64 4384334752651165692, ; 98: DevExpress.Maui.CollectionView.dll => 0x3cd8493a742c3ffc => 40
	i64 4401076402506455931, ; 99: DXGrid.a => 0x3d13c3ab90c05b7b => 46
	i64 4477672992252076438, ; 100: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 170
	i64 4513320955448359355, ; 101: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 53
	i64 4612482779465751747, ; 102: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 52
	i64 4648976354129798698, ; 103: DXScheduler.a.dll => 0x40847b5cdd18e62a => 49
	i64 4679594760078841447, ; 104: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4725285941539738176, ; 105: Xamarin.AndroidX.Camera.Lifecycle => 0x41939687379f9240 => 79
	i64 4743821336939966868, ; 106: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 118
	i64 4783554999938465879, ; 107: CommunityToolkit.Maui.Markup.dll => 0x426299ed96e04057 => 37
	i64 4794310189461587505, ; 108: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 75
	i64 4795410492532947900, ; 109: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 100
	i64 4809057822547766521, ; 110: System.Drawing => 0x42bd349c3145ecf9 => 128
	i64 4814660307502931973, ; 111: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 141
	i64 4853321196694829351, ; 112: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 155
	i64 5081566143765835342, ; 113: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 151
	i64 5099468265966638712, ; 114: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 151
	i64 5103417709280584325, ; 115: System.Collections.Specialized => 0x46d2fb5e161b6285 => 116
	i64 5182934613077526976, ; 116: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 116
	i64 5290786973231294105, ; 117: System.Runtime.Loader => 0x496ca6b869b72699 => 155
	i64 5423376490970181369, ; 118: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 153
	i64 5471532531798518949, ; 119: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 120: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 121: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 130
	i64 5573260873512690141, ; 122: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 161
	i64 5624375662354994915, ; 123: SixLabors.ImageSharp.dll => 0x4e0dcbdd9e0596e3 => 73
	i64 5692067934154308417, ; 124: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 102
	i64 5979151488806146654, ; 125: System.Formats.Asn1 => 0x52fa3699a489d25e => 129
	i64 6068057819846744445, ; 126: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 127: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 128: System.Text.Json.dll => 0x565a67a0ffe264a7 => 164
	i64 6251069312384999852, ; 129: System.Transactions.Local => 0x56c0426b870da1ac => 169
	i64 6357457916754632952, ; 130: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 131: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 90
	i64 6478287442656530074, ; 132: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6533378104089823227, ; 133: ZXing.ImageSharp => 0x5aab38c53596c7fb => 108
	i64 6548213210057960872, ; 134: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 86
	i64 6560151584539558821, ; 135: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 62
	i64 6617685658146568858, ; 136: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 162
	i64 6743165466166707109, ; 137: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 138: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 139: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 125
	i64 6894844156784520562, ; 140: System.Numerics.Vectors => 0x5faf683aead1ad72 => 147
	i64 6985504089449394141, ; 141: ZXing.Net.MAUI.Controls.dll => 0x60f17ef564ab6fdd => 110
	i64 7045132749165778210, ; 142: DevExpress.Maui.Scheduler.dll => 0x61c556e89d7f5522 => 50
	i64 7060896174307865760, ; 143: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 166
	i64 7112547816752919026, ; 144: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 132
	i64 7142976273706224655, ; 145: DXNavigation.a.dll => 0x6320f313694d8c0f => 42
	i64 7220009545223068405, ; 146: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7229955455499660495, ; 147: DXCollectionView.a.dll => 0x6455f62e4af46ccf => 39
	i64 7270811800166795866, ; 148: System.Linq => 0x64e71ccf51a90a5a => 137
	i64 7316205155833392065, ; 149: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 112
	i64 7377312882064240630, ; 150: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 120
	i64 7489048572193775167, ; 151: System.ObjectModel => 0x67ee71ff6b419e3f => 148
	i64 7654504624184590948, ; 152: System.Net.Http => 0x6a3a4366801b8264 => 139
	i64 7694700312542370399, ; 153: System.Net.Mail => 0x6ac9112a7e2cda5f => 140
	i64 7702918024138448955, ; 154: MySqlConnector => 0x6ae6432192b9e03b => 70
	i64 7708790323521193081, ; 155: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 156: System.Private.CoreLib => 0x6b0ff375198b9c17 => 173
	i64 7735352534559001595, ; 157: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 105
	i64 7789592736793255292, ; 158: DevExpress.Maui.Controls.dll => 0x6c1a3152b5865d7c => 43
	i64 7836164640616011524, ; 159: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 77
	i64 7972383140441761405, ; 160: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 54
	i64 8064050204834738623, ; 161: System.Collections.dll => 0x6fe942efa61731bf => 117
	i64 8083354569033831015, ; 162: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 89
	i64 8087206902342787202, ; 163: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 124
	i64 8167236081217502503, ; 164: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 174
	i64 8185542183669246576, ; 165: System.Collections => 0x7198e33f4794aa70 => 117
	i64 8246048515196606205, ; 166: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 69
	i64 8290740647658429042, ; 167: System.Runtime.Extensions => 0x730ea0b15c929a72 => 152
	i64 8320777595162576093, ; 168: Xamarin.AndroidX.Camera.View => 0x737957232eb1c4dd => 80
	i64 8368701292315763008, ; 169: System.Security.Cryptography => 0x7423997c6fd56140 => 161
	i64 8400357532724379117, ; 170: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 97
	i64 8518412311883997971, ; 171: System.Collections.Immutable => 0x76377add7c28e313 => 114
	i64 8563666267364444763, ; 172: System.Private.Uri => 0x76d841191140ca5b => 149
	i64 8599632406834268464, ; 173: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8614108721271900878, ; 174: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 175: Java.Interop => 0x77b654e585b55834 => 174
	i64 8629545377263870989, ; 176: Xamarin.AndroidX.Camera.Core.dll => 0x77c24dcca0ed640d => 78
	i64 8639588376636138208, ; 177: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 96
	i64 8677882282824630478, ; 178: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 179: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 124
	i64 9045785047181495996, ; 180: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9111603110219107042, ; 181: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 55
	i64 9131857290992441898, ; 182: Xamarin.AndroidX.Camera.Core => 0x7ebadfd2d12a5a2a => 78
	i64 9250544137016314866, ; 183: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 51
	i64 9312692141327339315, ; 184: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 102
	i64 9324707631942237306, ; 185: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 76
	i64 9342122023452561803, ; 186: SixLabors.ImageSharp => 0x81a5e27bd03e518b => 73
	i64 9552911931735491231, ; 187: DXNavigation.a => 0x8492c2c9d5af429f => 42
	i64 9659729154652888475, ; 188: System.Text.RegularExpressions => 0x860e407c9991dd9b => 165
	i64 9678050649315576968, ; 189: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 83
	i64 9702891218465930390, ; 190: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 115
	i64 9808709177481450983, ; 191: Mono.Android.dll => 0x881f890734e555e7 => 176
	i64 9933555792566666578, ; 192: System.Linq.Queryable.dll => 0x89db145cf475c552 => 136
	i64 9956195530459977388, ; 193: Microsoft.Maui => 0x8a2b8315b36616ac => 67
	i64 9991543690424095600, ; 194: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 195: System.Net.Http.dll => 0x8b50e941206af13b => 139
	i64 10051358222726253779, ; 196: System.Private.Xml => 0x8b7d990c97ccccd3 => 150
	i64 10080807920783533798, ; 197: DXGrid.a.dll => 0x8be63964bf3f26e6 => 46
	i64 10092835686693276772, ; 198: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 65
	i64 10105485790837105934, ; 199: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 166
	i64 10143853363526200146, ; 200: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 201: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 86
	i64 10258340260528075680, ; 202: CommunityToolkit.Maui.Markup => 0x8e5cf21daddd33a0 => 37
	i64 10406448008575299332, ; 203: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 106
	i64 10430153318873392755, ; 204: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 84
	i64 10454871586088267783, ; 205: DevExpress.Maui.DataGrid => 0x91172a50b51db007 => 47
	i64 10506226065143327199, ; 206: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10670374202010151210, ; 207: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 112
	i64 10678444886965028446, ; 208: DevExpress.Maui.Editors.dll => 0x9431750c4123065e => 48
	i64 10714184849103829812, ; 209: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 152
	i64 10785150219063592792, ; 210: System.Net.Primitives => 0x95ac8cfb68830758 => 143
	i64 10811915265162633087, ; 211: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 53
	i64 10822644899632537592, ; 212: System.Linq.Queryable => 0x9631c23204ca5ff8 => 136
	i64 10880838204485145808, ; 213: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 10964653383833615866, ; 214: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 126
	i64 11002576679268595294, ; 215: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 61
	i64 11009005086950030778, ; 216: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 67
	i64 11089314871468410253, ; 217: DevExpress.Maui.CollectionView => 0x99e5291f3454c58d => 40
	i64 11103970607964515343, ; 218: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 219: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 101
	i64 11220793807500858938, ; 220: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 221: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 62
	i64 11340910727871153756, ; 222: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 85
	i64 11485890710487134646, ; 223: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 154
	i64 11518296021396496455, ; 224: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 225: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 101
	i64 11530571088791430846, ; 226: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 60
	i64 11705530742807338875, ; 227: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 12075303808054746781, ; 228: Plugin.Maui.Audio.dll => 0xa79418d5f2065e9d => 71
	i64 12145679461940342714, ; 229: System.Text.Json => 0xa88e1f1ebcb62fba => 164
	i64 12201331334810686224, ; 230: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 158
	i64 12269460666702402136, ; 231: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 114
	i64 12341818387765915815, ; 232: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 233: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 88
	i64 12466513435562512481, ; 234: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 93
	i64 12475113361194491050, ; 235: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 236: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 125
	i64 12538491095302438457, ; 237: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 81
	i64 12550732019250633519, ; 238: System.IO.Compression => 0xae2d28465e8e1b2f => 131
	i64 12551451704392164662, ; 239: MySqlConnector.dll => 0xae2fb6d31fc42536 => 70
	i64 12681088699309157496, ; 240: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 241: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 82
	i64 12760970142902902754, ; 242: Xamarin.AndroidX.Camera.Lifecycle.dll => 0xb11812bc0517dfe2 => 79
	i64 12823819093633476069, ; 243: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 244: System.IO.Pipes => 0xb21ff0d5d6c0740f => 134
	i64 12843321153144804894, ; 245: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 63
	i64 12963446364377008305, ; 246: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 74
	i64 13041731019321118825, ; 247: Plugin.Maui.Audio => 0xb4fd894396d41069 => 71
	i64 13068258254871114833, ; 248: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 157
	i64 13221551921002590604, ; 249: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 250: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13236013933113115140, ; 251: DXScheduler.a => 0xb7afc48b75540204 => 49
	i64 13315587268572539134, ; 252: DevExpress.Maui.DataGrid.dll => 0xb8ca78125efae8fe => 47
	i64 13343850469010654401, ; 253: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 175
	i64 13381594904270902445, ; 254: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13454009404024712428, ; 255: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 104
	i64 13465488254036897740, ; 256: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 105
	i64 13467053111158216594, ; 257: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 258: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 259: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 260: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 98
	i64 13717397318615465333, ; 261: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 119
	i64 13755568601956062840, ; 262: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 263: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13869184409905670989, ; 264: DevExpress.Data.v24.1.dll => 0xc0793dbd1cd02b4d => 38
	i64 13881769479078963060, ; 265: System.Console.dll => 0xc0a5f3cade5c6774 => 122
	i64 13959074834287824816, ; 266: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 88
	i64 14100563506285742564, ; 267: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 268: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 81
	i64 14125464355221830302, ; 269: System.Threading.dll => 0xc407bafdbc707a9e => 168
	i64 14133832980772275001, ; 270: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 51
	i64 14461014870687870182, ; 271: System.Net.Requests.dll => 0xc8afd8683afdece6 => 144
	i64 14464374589798375073, ; 272: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 273: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 274: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 163
	i64 14556034074661724008, ; 275: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14622043554576106986, ; 276: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 157
	i64 14653669531502871807, ; 277: DevExpress.Maui.Core.dll => 0xcb5c4acce93184ff => 45
	i64 14669215534098758659, ; 278: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 58
	i64 14690985099581930927, ; 279: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 170
	i64 14705122255218365489, ; 280: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 281: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14792063746108907174, ; 282: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 104
	i64 14832630590065248058, ; 283: System.Security.Claims => 0xcdd816ef5d6e873a => 160
	i64 14852515768018889994, ; 284: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 85
	i64 14892012299694389861, ; 285: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 286: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14935719434541007538, ; 287: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 162
	i64 14954917835170835695, ; 288: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 59
	i64 14987728460634540364, ; 289: System.IO.Compression.dll => 0xcfff1ba06622494c => 131
	i64 15015154896917945444, ; 290: System.Net.Security.dll => 0xd0608bd33642dc64 => 145
	i64 15076659072870671916, ; 291: System.ObjectModel.dll => 0xd13b0d8c1620662c => 148
	i64 15111608613780139878, ; 292: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 293: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 130
	i64 15133485256822086103, ; 294: System.Linq.dll => 0xd204f0a9127dd9d7 => 137
	i64 15227001540531775957, ; 295: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 57
	i64 15370334346939861994, ; 296: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 84
	i64 15391712275433856905, ; 297: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 59
	i64 15527772828719725935, ; 298: System.Console => 0xd77dbb1e38cd3d6f => 122
	i64 15536481058354060254, ; 299: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15557562860424774966, ; 300: System.Net.Sockets => 0xd7e790fe7a6dc536 => 146
	i64 15582737692548360875, ; 301: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 92
	i64 15609085926864131306, ; 302: System.dll => 0xd89e9cf3334914ea => 172
	i64 15661133872274321916, ; 303: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 171
	i64 15664356999916475676, ; 304: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 305: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15750144475371186037, ; 306: Xamarin.AndroidX.Camera.View.dll => 0xda93c0f3d794a775 => 80
	i64 15783653065526199428, ; 307: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15928521404965645318, ; 308: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 64
	i64 16018552496348375205, ; 309: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 142
	i64 16154507427712707110, ; 310: System => 0xe03056ea4e39aa26 => 172
	i64 16219561732052121626, ; 311: System.Net.Security => 0xe1177575db7c781a => 145
	i64 16274182383641215830, ; 312: zxing.dll => 0xe1d982a752dac356 => 107
	i64 16288847719894691167, ; 313: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 314: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 61
	i64 16454459195343277943, ; 315: System.Net.NetworkInformation => 0xe459fb756d988f77 => 142
	i64 16649148416072044166, ; 316: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 69
	i64 16677317093839702854, ; 317: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 97
	i64 16795178957077639253, ; 318: DXCore.a => 0xe9147646dbba7055 => 44
	i64 16856067890322379635, ; 319: System.Data.Common.dll => 0xe9ecc87060889373 => 123
	i64 16885326587688996227, ; 320: ZXing.Net.MAUI.dll => 0xea54bb11b7a94d83 => 109
	i64 16890310621557459193, ; 321: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 165
	i64 16942731696432749159, ; 322: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 323: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 95
	i64 17008137082415910100, ; 324: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 115
	i64 17031351772568316411, ; 325: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 94
	i64 17040771374769818752, ; 326: zxing => 0xec7cfb478bcccc80 => 107
	i64 17062143951396181894, ; 327: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 119
	i64 17089008752050867324, ; 328: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17187273293601214786, ; 329: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 118
	i64 17234219099804750107, ; 330: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 169
	i64 17260702271250283638, ; 331: System.Data.Common => 0xef8a5543bba6bc76 => 123
	i64 17306917412052548875, ; 332: ZXing.Net.MAUI => 0xf02e85b0b66a3d0b => 109
	i64 17333249706306540043, ; 333: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 126
	i64 17342750010158924305, ; 334: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 335: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17451281075798943988, ; 336: Pomelo.EntityFrameworkCore.MySql => 0xf22f67ad767e28f4 => 72
	i64 17514990004910432069, ; 337: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 338: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 339: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 340: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 93
	i64 17710060891934109755, ; 341: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 91
	i64 17712670374920797664, ; 342: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 154
	i64 17777860260071588075, ; 343: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 156
	i64 17802486580085668190, ; 344: DevExpress.Data.v24.1 => 0xf70f233914aa395e => 38
	i64 18017743553296241350, ; 345: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 54
	i64 18025913125965088385, ; 346: System.Threading => 0xfa28e87b91334681 => 168
	i64 18099568558057551825, ; 347: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 348: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 94
	i64 18146411883821974900, ; 349: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 129
	i64 18245806341561545090, ; 350: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 113
	i64 18305135509493619199, ; 351: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 96
	i64 18324163916253801303, ; 352: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18335459783622540540 ; 353: ZXing.Net.MAUI.Controls => 0xfe74a3871c483cfc => 110
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [354 x i32] [
	i32 72, ; 0
	i32 63, ; 1
	i32 176, ; 2
	i32 68, ; 3
	i32 135, ; 4
	i32 82, ; 5
	i32 99, ; 6
	i32 7, ; 7
	i32 41, ; 8
	i32 50, ; 9
	i32 74, ; 10
	i32 167, ; 11
	i32 121, ; 12
	i32 10, ; 13
	i32 87, ; 14
	i32 103, ; 15
	i32 18, ; 16
	i32 48, ; 17
	i32 128, ; 18
	i32 41, ; 19
	i32 111, ; 20
	i32 95, ; 21
	i32 143, ; 22
	i32 65, ; 23
	i32 175, ; 24
	i32 167, ; 25
	i32 16, ; 26
	i32 77, ; 27
	i32 92, ; 28
	i32 140, ; 29
	i32 138, ; 30
	i32 149, ; 31
	i32 76, ; 32
	i32 153, ; 33
	i32 6, ; 34
	i32 99, ; 35
	i32 127, ; 36
	i32 28, ; 37
	i32 66, ; 38
	i32 28, ; 39
	i32 91, ; 40
	i32 2, ; 41
	i32 20, ; 42
	i32 133, ; 43
	i32 127, ; 44
	i32 52, ; 45
	i32 43, ; 46
	i32 87, ; 47
	i32 113, ; 48
	i32 24, ; 49
	i32 132, ; 50
	i32 90, ; 51
	i32 163, ; 52
	i32 83, ; 53
	i32 159, ; 54
	i32 75, ; 55
	i32 27, ; 56
	i32 141, ; 57
	i32 58, ; 58
	i32 2, ; 59
	i32 108, ; 60
	i32 39, ; 61
	i32 7, ; 62
	i32 111, ; 63
	i32 103, ; 64
	i32 89, ; 65
	i32 147, ; 66
	i32 156, ; 67
	i32 146, ; 68
	i32 106, ; 69
	i32 68, ; 70
	i32 133, ; 71
	i32 56, ; 72
	i32 100, ; 73
	i32 55, ; 74
	i32 173, ; 75
	i32 22, ; 76
	i32 159, ; 77
	i32 57, ; 78
	i32 171, ; 79
	i32 56, ; 80
	i32 98, ; 81
	i32 60, ; 82
	i32 66, ; 83
	i32 144, ; 84
	i32 138, ; 85
	i32 158, ; 86
	i32 150, ; 87
	i32 64, ; 88
	i32 33, ; 89
	i32 45, ; 90
	i32 121, ; 91
	i32 160, ; 92
	i32 135, ; 93
	i32 120, ; 94
	i32 30, ; 95
	i32 44, ; 96
	i32 134, ; 97
	i32 40, ; 98
	i32 46, ; 99
	i32 170, ; 100
	i32 53, ; 101
	i32 52, ; 102
	i32 49, ; 103
	i32 0, ; 104
	i32 79, ; 105
	i32 118, ; 106
	i32 37, ; 107
	i32 75, ; 108
	i32 100, ; 109
	i32 128, ; 110
	i32 141, ; 111
	i32 155, ; 112
	i32 151, ; 113
	i32 151, ; 114
	i32 116, ; 115
	i32 116, ; 116
	i32 155, ; 117
	i32 153, ; 118
	i32 26, ; 119
	i32 29, ; 120
	i32 130, ; 121
	i32 161, ; 122
	i32 73, ; 123
	i32 102, ; 124
	i32 129, ; 125
	i32 23, ; 126
	i32 23, ; 127
	i32 164, ; 128
	i32 169, ; 129
	i32 34, ; 130
	i32 90, ; 131
	i32 11, ; 132
	i32 108, ; 133
	i32 86, ; 134
	i32 62, ; 135
	i32 162, ; 136
	i32 19, ; 137
	i32 22, ; 138
	i32 125, ; 139
	i32 147, ; 140
	i32 110, ; 141
	i32 50, ; 142
	i32 166, ; 143
	i32 132, ; 144
	i32 42, ; 145
	i32 26, ; 146
	i32 39, ; 147
	i32 137, ; 148
	i32 112, ; 149
	i32 120, ; 150
	i32 148, ; 151
	i32 139, ; 152
	i32 140, ; 153
	i32 70, ; 154
	i32 17, ; 155
	i32 173, ; 156
	i32 105, ; 157
	i32 43, ; 158
	i32 77, ; 159
	i32 54, ; 160
	i32 117, ; 161
	i32 89, ; 162
	i32 124, ; 163
	i32 174, ; 164
	i32 117, ; 165
	i32 69, ; 166
	i32 152, ; 167
	i32 80, ; 168
	i32 161, ; 169
	i32 97, ; 170
	i32 114, ; 171
	i32 149, ; 172
	i32 35, ; 173
	i32 21, ; 174
	i32 174, ; 175
	i32 78, ; 176
	i32 96, ; 177
	i32 21, ; 178
	i32 124, ; 179
	i32 31, ; 180
	i32 55, ; 181
	i32 78, ; 182
	i32 51, ; 183
	i32 102, ; 184
	i32 76, ; 185
	i32 73, ; 186
	i32 42, ; 187
	i32 165, ; 188
	i32 83, ; 189
	i32 115, ; 190
	i32 176, ; 191
	i32 136, ; 192
	i32 67, ; 193
	i32 6, ; 194
	i32 139, ; 195
	i32 150, ; 196
	i32 46, ; 197
	i32 65, ; 198
	i32 166, ; 199
	i32 3, ; 200
	i32 86, ; 201
	i32 37, ; 202
	i32 106, ; 203
	i32 84, ; 204
	i32 47, ; 205
	i32 1, ; 206
	i32 112, ; 207
	i32 48, ; 208
	i32 152, ; 209
	i32 143, ; 210
	i32 53, ; 211
	i32 136, ; 212
	i32 35, ; 213
	i32 126, ; 214
	i32 61, ; 215
	i32 67, ; 216
	i32 40, ; 217
	i32 12, ; 218
	i32 101, ; 219
	i32 15, ; 220
	i32 62, ; 221
	i32 85, ; 222
	i32 154, ; 223
	i32 13, ; 224
	i32 101, ; 225
	i32 60, ; 226
	i32 9, ; 227
	i32 71, ; 228
	i32 164, ; 229
	i32 158, ; 230
	i32 114, ; 231
	i32 36, ; 232
	i32 88, ; 233
	i32 93, ; 234
	i32 34, ; 235
	i32 125, ; 236
	i32 81, ; 237
	i32 131, ; 238
	i32 70, ; 239
	i32 14, ; 240
	i32 82, ; 241
	i32 79, ; 242
	i32 27, ; 243
	i32 134, ; 244
	i32 63, ; 245
	i32 74, ; 246
	i32 71, ; 247
	i32 157, ; 248
	i32 1, ; 249
	i32 15, ; 250
	i32 49, ; 251
	i32 47, ; 252
	i32 175, ; 253
	i32 9, ; 254
	i32 104, ; 255
	i32 105, ; 256
	i32 29, ; 257
	i32 30, ; 258
	i32 13, ; 259
	i32 98, ; 260
	i32 119, ; 261
	i32 8, ; 262
	i32 11, ; 263
	i32 38, ; 264
	i32 122, ; 265
	i32 88, ; 266
	i32 3, ; 267
	i32 81, ; 268
	i32 168, ; 269
	i32 51, ; 270
	i32 144, ; 271
	i32 24, ; 272
	i32 5, ; 273
	i32 163, ; 274
	i32 36, ; 275
	i32 157, ; 276
	i32 45, ; 277
	i32 58, ; 278
	i32 170, ; 279
	i32 16, ; 280
	i32 32, ; 281
	i32 104, ; 282
	i32 160, ; 283
	i32 85, ; 284
	i32 33, ; 285
	i32 0, ; 286
	i32 162, ; 287
	i32 59, ; 288
	i32 131, ; 289
	i32 145, ; 290
	i32 148, ; 291
	i32 17, ; 292
	i32 130, ; 293
	i32 137, ; 294
	i32 57, ; 295
	i32 84, ; 296
	i32 59, ; 297
	i32 122, ; 298
	i32 4, ; 299
	i32 146, ; 300
	i32 92, ; 301
	i32 172, ; 302
	i32 171, ; 303
	i32 4, ; 304
	i32 12, ; 305
	i32 80, ; 306
	i32 5, ; 307
	i32 64, ; 308
	i32 142, ; 309
	i32 172, ; 310
	i32 145, ; 311
	i32 107, ; 312
	i32 18, ; 313
	i32 61, ; 314
	i32 142, ; 315
	i32 69, ; 316
	i32 97, ; 317
	i32 44, ; 318
	i32 123, ; 319
	i32 109, ; 320
	i32 165, ; 321
	i32 25, ; 322
	i32 95, ; 323
	i32 115, ; 324
	i32 94, ; 325
	i32 107, ; 326
	i32 119, ; 327
	i32 32, ; 328
	i32 118, ; 329
	i32 169, ; 330
	i32 123, ; 331
	i32 109, ; 332
	i32 126, ; 333
	i32 10, ; 334
	i32 25, ; 335
	i32 72, ; 336
	i32 8, ; 337
	i32 20, ; 338
	i32 31, ; 339
	i32 93, ; 340
	i32 91, ; 341
	i32 154, ; 342
	i32 156, ; 343
	i32 38, ; 344
	i32 54, ; 345
	i32 168, ; 346
	i32 19, ; 347
	i32 94, ; 348
	i32 129, ; 349
	i32 113, ; 350
	i32 96, ; 351
	i32 14, ; 352
	i32 110 ; 353
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}

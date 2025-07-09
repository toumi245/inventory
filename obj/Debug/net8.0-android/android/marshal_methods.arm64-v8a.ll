; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [346 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [692 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 248
	i64 54532244727808411, ; 1: Pomelo.EntityFrameworkCore.MySql.dll => 0xc1bcc9a3ce419b => 212
	i64 98382396393917666, ; 2: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 203
	i64 120698629574877762, ; 3: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 4: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 208
	i64 196720943101637631, ; 5: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 6: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 235
	i64 229794953483747371, ; 7: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 8: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 276
	i64 295915112840604065, ; 9: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 279
	i64 316157742385208084, ; 10: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 242
	i64 350667413455104241, ; 11: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 396868157601372792, ; 12: Microsoft.VisualStudio.DesignTools.TapContract => 0x581f57c947e5a78 => 344
	i64 422779754995088667, ; 13: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 14: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 278
	i64 545109961164950392, ; 15: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 315
	i64 558811379087732614, ; 16: DXEditors.a.dll => 0x7c14bfd12f86f86 => 179
	i64 560278790331054453, ; 17: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 602358440769925478, ; 18: DevExpress.Maui.Scheduler => 0x85c01cf798cb166 => 188
	i64 634308326490598313, ; 19: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 261
	i64 649145001856603771, ; 20: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 702024105029695270, ; 21: System.Drawing.Common => 0x9be17343c0e7726 => 214
	i64 750875890346172408, ; 22: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 23: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 236
	i64 799765834175365804, ; 24: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 25: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 318
	i64 872800313462103108, ; 26: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 247
	i64 895210737996778430, ; 27: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 262
	i64 940822596282819491, ; 28: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 29: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 30: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1120440138749646132, ; 31: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 291
	i64 1121665720830085036, ; 32: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 326
	i64 1244917166771784164, ; 33: DevExpress.Maui.Editors => 0x1146d5913c37c9e4 => 186
	i64 1268860745194512059, ; 34: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301626418029409250, ; 35: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 36: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 226
	i64 1348139812537487829, ; 37: DXEditors.a => 0x12b58e0449dbd1d5 => 179
	i64 1360400237942931197, ; 38: CodeABarre => 0x12e11ccf06f1fefd => 0
	i64 1369545283391376210, ; 39: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 269
	i64 1404195534211153682, ; 40: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 41: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 42: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 43: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 205
	i64 1491290866305144020, ; 44: Xamarin.Google.AutoValue.Annotations.dll => 0x14b2212446e714d4 => 292
	i64 1492954217099365037, ; 45: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 46: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1537168428375924959, ; 47: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 48: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 324
	i64 1576750169145655260, ; 49: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 290
	i64 1624659445732251991, ; 50: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 225
	i64 1628611045998245443, ; 51: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 265
	i64 1636321030536304333, ; 52: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 255
	i64 1651782184287836205, ; 53: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 54: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1682513316613008342, ; 55: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1735388228521408345, ; 56: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 57: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 58: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 59: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 224
	i64 1825687700144851180, ; 60: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 61: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 314
	i64 1836611346387731153, ; 62: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 276
	i64 1854145951182283680, ; 63: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 64: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 65: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 221
	i64 1881198190668717030, ; 66: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 336
	i64 1897575647115118287, ; 67: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 278
	i64 1918852405404808846, ; 68: Xamarin.AndroidX.AutoFill.dll => 0x1aa12218a08eb68e => 228
	i64 1920760634179481754, ; 69: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 206
	i64 1959996714666907089, ; 70: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 336
	i64 1972385128188460614, ; 71: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 72: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 263
	i64 1983698669889758782, ; 73: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 310
	i64 2019660174692588140, ; 74: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 328
	i64 2040001226662520565, ; 75: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 76: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 77: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 300
	i64 2080945842184875448, ; 78: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 79: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 80: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2165252314452558154, ; 81: Xamarin.AndroidX.Camera.Camera2.dll => 0x1e0c85820c09814a => 230
	i64 2165310824878145998, ; 82: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 218
	i64 2165725771938924357, ; 83: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 229
	i64 2192948757939169934, ; 84: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 191
	i64 2200176636225660136, ; 85: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 201
	i64 2210058262765462106, ; 86: DevExpress.Maui.Controls => 0x1eabb447d50d625a => 181
	i64 2262844636196693701, ; 87: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 247
	i64 2287834202362508563, ; 88: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 89: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 90: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 332
	i64 2304837677853103545, ; 91: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 275
	i64 2315304989185124968, ; 92: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 93: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 258
	i64 2335503487726329082, ; 94: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 95: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2470498323731680442, ; 96: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 240
	i64 2479423007379663237, ; 97: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 285
	i64 2497223385847772520, ; 98: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 99: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 219
	i64 2592350477072141967, ; 100: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 101: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 335
	i64 2624866290265602282, ; 102: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 103: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 104: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 197
	i64 2662981627730767622, ; 105: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 310
	i64 2706075432581334785, ; 106: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2760062011565844085, ; 107: ZXing.ImageSharp.dll => 0x264db5c6ad6ea675 => 305
	i64 2783046991838674048, ; 108: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 109: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 280
	i64 2815524396660695947, ; 110: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2870618300109509804, ; 111: DXCollectionView.a => 0x27d67c227fc354ac => 177
	i64 2895129759130297543, ; 112: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 315
	i64 2923871038697555247, ; 113: Jsr305Binding => 0x2893ad37e69ec52f => 293
	i64 2988350815963275936, ; 114: CodeABarre.dll => 0x2978c13bf1bd62a0 => 0
	i64 3017136373564924869, ; 115: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 116: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 291
	i64 3062772059105072826, ; 117: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0x2a8126f5e2f316ba => 343
	i64 3106852385031680087, ; 118: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 119: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 120: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3281594302220646930, ; 121: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 122: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 256
	i64 3303437397778967116, ; 123: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 222
	i64 3311221304742556517, ; 124: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 125: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 126: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 127: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 303
	i64 3355395775298280038, ; 128: Xamarin.AndroidX.AutoFill => 0x2e90c2ae13801a66 => 228
	i64 3429672777697402584, ; 129: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 208
	i64 3437845325506641314, ; 130: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 131: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 282
	i64 3494946837667399002, ; 132: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 195
	i64 3508450208084372758, ; 133: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 134: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 281
	i64 3523004241079211829, ; 135: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 194
	i64 3531994851595924923, ; 136: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 137: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 138: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 330
	i64 3571415421602489686, ; 139: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 140: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 196
	i64 3647754201059316852, ; 141: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 142: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 195
	i64 3659371656528649588, ; 143: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 216
	i64 3716579019761409177, ; 144: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 145: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 274
	i64 3772598417116884899, ; 146: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 248
	i64 3869221888984012293, ; 147: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 199
	i64 3869649043256705283, ; 148: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3890352374528606784, ; 149: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 206
	i64 3919223565570527920, ; 150: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 151: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 152: System.Memory => 0x370b03412596249e => 62
	i64 4006972109285359177, ; 153: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 154: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 155: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 156: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 204
	i64 4120493066591692148, ; 157: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 341
	i64 4127427327551562508, ; 158: DevExpress.Maui.Core => 0x394791494ef3630c => 183
	i64 4148881117810174540, ; 159: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 160: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 161: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 162: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 163: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 164: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 242
	i64 4205801962323029395, ; 165: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 166: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4282138915307457788, ; 167: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4321177614414309855, ; 168: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x3bf7e8254e88e9df => 343
	i64 4356591372459378815, ; 169: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 338
	i64 4367142137090651694, ; 170: DXCore.a.dll => 0x3c9b34a2b4edb62e => 182
	i64 4373617458794931033, ; 171: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4384334752651165692, ; 172: DevExpress.Maui.CollectionView.dll => 0x3cd8493a742c3ffc => 178
	i64 4388777479429739993, ; 173: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x3ce811dd63a4d5d9 => 342
	i64 4397634830160618470, ; 174: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4401076402506455931, ; 175: DXGrid.a => 0x3d13c3ab90c05b7b => 184
	i64 4477672992252076438, ; 176: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 177: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4513320955448359355, ; 178: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 192
	i64 4533124835995628778, ; 179: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4612482779465751747, ; 180: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 191
	i64 4636684751163556186, ; 181: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 286
	i64 4648976354129798698, ; 182: DXScheduler.a.dll => 0x40847b5cdd18e62a => 187
	i64 4672453897036726049, ; 183: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 184: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 308
	i64 4716677666592453464, ; 185: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4725285941539738176, ; 186: Xamarin.AndroidX.Camera.Lifecycle => 0x41939687379f9240 => 232
	i64 4743821336939966868, ; 187: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 188: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 260
	i64 4783554999938465879, ; 189: CommunityToolkit.Maui.Markup.dll => 0x426299ed96e04057 => 175
	i64 4794310189461587505, ; 190: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 219
	i64 4795410492532947900, ; 191: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 281
	i64 4809057822547766521, ; 192: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 193: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 194: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 195: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 220
	i64 5081566143765835342, ; 196: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 197: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 198: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 199: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 200: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 267
	i64 5244375036463807528, ; 201: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 202: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 203: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 204: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 259
	i64 5290786973231294105, ; 205: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5376510917114486089, ; 206: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 285
	i64 5408338804355907810, ; 207: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 283
	i64 5423376490970181369, ; 208: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 209: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 210: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 211: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 238
	i64 5457765010617926378, ; 212: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 213: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 334
	i64 5507995362134886206, ; 214: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 215: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 337
	i64 5527431512186326818, ; 216: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 217: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 218: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 219: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 223
	i64 5591791169662171124, ; 220: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5624375662354994915, ; 221: SixLabors.ImageSharp.dll => 0x4e0dcbdd9e0596e3 => 213
	i64 5650097808083101034, ; 222: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 223: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 288
	i64 5724799082821825042, ; 224: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 251
	i64 5757522595884336624, ; 225: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 237
	i64 5783556987928984683, ; 226: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 227: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 257
	i64 5959344983920014087, ; 228: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 277
	i64 5979151488806146654, ; 229: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 230: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 231: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 331
	i64 6102788177522843259, ; 232: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 277
	i64 6200764641006662125, ; 233: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 331
	i64 6222399776351216807, ; 234: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 235: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 236: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 237: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6319713645133255417, ; 238: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 261
	i64 6357457916754632952, ; 239: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 345
	i64 6401687960814735282, ; 240: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 258
	i64 6478287442656530074, ; 241: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 319
	i64 6504860066809920875, ; 242: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 229
	i64 6533378104089823227, ; 243: ZXing.ImageSharp => 0x5aab38c53596c7fb => 305
	i64 6548213210057960872, ; 244: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 244
	i64 6557084851308642443, ; 245: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 289
	i64 6560151584539558821, ; 246: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 202
	i64 6589202984700901502, ; 247: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 295
	i64 6591971792923354531, ; 248: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 259
	i64 6617685658146568858, ; 249: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6713440830605852118, ; 250: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 251: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 252: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 327
	i64 6772837112740759457, ; 253: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 254: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 330
	i64 6786606130239981554, ; 255: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 256: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 257: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 258: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 259: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6985504089449394141, ; 260: ZXing.Net.MAUI.Controls.dll => 0x60f17ef564ab6fdd => 307
	i64 7011053663211085209, ; 261: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 253
	i64 7045132749165778210, ; 262: DevExpress.Maui.Scheduler.dll => 0x61c556e89d7f5522 => 188
	i64 7060896174307865760, ; 263: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 264: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 265: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 266: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 254
	i64 7112547816752919026, ; 267: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7142976273706224655, ; 268: DXNavigation.a.dll => 0x6320f313694d8c0f => 180
	i64 7192745174564810625, ; 269: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 218
	i64 7220009545223068405, ; 270: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 334
	i64 7229955455499660495, ; 271: DXCollectionView.a.dll => 0x6455f62e4af46ccf => 177
	i64 7270811800166795866, ; 272: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 273: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 274: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 275: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 276: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 217
	i64 7377312882064240630, ; 277: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7488575175965059935, ; 278: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 279: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7592577537120840276, ; 280: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 281: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 282: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 283: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7702918024138448955, ; 284: MySqlConnector => 0x6ae6432192b9e03b => 210
	i64 7708790323521193081, ; 285: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 325
	i64 7714652370974252055, ; 286: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 287: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 262
	i64 7735176074855944702, ; 288: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 289: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 298
	i64 7756332380610150586, ; 290: Xamarin.Google.AutoValue.Annotations => 0x6ba407349220c0ba => 292
	i64 7789592736793255292, ; 291: DevExpress.Maui.Controls.dll => 0x6c1a3152b5865d7c => 181
	i64 7791074099216502080, ; 292: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 293: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 294: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 225
	i64 7972383140441761405, ; 295: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 193
	i64 8025517457475554965, ; 296: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 297: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 298: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 299: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 256
	i64 8085230611270010360, ; 300: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 301: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 302: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 303: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 304: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 305: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 306: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 302
	i64 8246048515196606205, ; 307: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 209
	i64 8264926008854159966, ; 308: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 309: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 310: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8320777595162576093, ; 311: Xamarin.AndroidX.Camera.View => 0x737957232eb1c4dd => 233
	i64 8368701292315763008, ; 312: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 313: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 239
	i64 8400357532724379117, ; 314: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 271
	i64 8410671156615598628, ; 315: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 316: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 260
	i64 8518412311883997971, ; 317: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8563666267364444763, ; 318: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 319: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 250
	i64 8599632406834268464, ; 320: CommunityToolkit.Maui => 0x7758081c784b4930 => 173
	i64 8601935802264776013, ; 321: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 283
	i64 8614108721271900878, ; 322: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 329
	i64 8623059219396073920, ; 323: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 324: Java.Interop => 0x77b654e585b55834 => 168
	i64 8629545377263870989, ; 325: Xamarin.AndroidX.Camera.Core.dll => 0x77c24dcca0ed640d => 231
	i64 8638972117149407195, ; 326: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 327: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 270
	i64 8648495978913578441, ; 328: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 329: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 329
	i64 8684531736582871431, ; 330: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 331: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8853378295825400934, ; 332: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 299
	i64 8941376889969657626, ; 333: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 334: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 273
	i64 8954753533646919997, ; 335: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9045785047181495996, ; 336: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 339
	i64 9111603110219107042, ; 337: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 194
	i64 9131857290992441898, ; 338: Xamarin.AndroidX.Camera.Core => 0x7ebadfd2d12a5a2a => 231
	i64 9138683372487561558, ; 339: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9250544137016314866, ; 340: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 190
	i64 9312692141327339315, ; 341: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 288
	i64 9324707631942237306, ; 342: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 224
	i64 9342122023452561803, ; 343: SixLabors.ImageSharp => 0x81a5e27bd03e518b => 213
	i64 9468215723722196442, ; 344: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9552911931735491231, ; 345: DXNavigation.a => 0x8492c2c9d5af429f => 180
	i64 9554839972845591462, ; 346: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 347: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 294
	i64 9584643793929893533, ; 348: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9659729154652888475, ; 349: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 350: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 351: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 352: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 240
	i64 9702891218465930390, ; 353: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 354: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 290
	i64 9808709177481450983, ; 355: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 356: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 237
	i64 9834056768316610435, ; 357: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 358: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9907349773706910547, ; 359: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 250
	i64 9933555792566666578, ; 360: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 361: Microsoft.Maui => 0x8a2b8315b36616ac => 207
	i64 9974604633896246661, ; 362: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 363: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 314
	i64 10017511394021241210, ; 364: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 201
	i64 10038780035334861115, ; 365: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 366: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 367: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10080807920783533798, ; 368: DXGrid.a.dll => 0x8be63964bf3f26e6 => 184
	i64 10089571585547156312, ; 369: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 370: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 205
	i64 10105485790837105934, ; 371: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 372: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 311
	i64 10226222362177979215, ; 373: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 300
	i64 10229024438826829339, ; 374: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 244
	i64 10236703004850800690, ; 375: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 376: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10252714262739571204, ; 377: Microsoft.Maui.Controls.HotReload.Forms => 0x8e48f54cfe2c5204 => 342
	i64 10258340260528075680, ; 378: CommunityToolkit.Maui.Markup => 0x8e5cf21daddd33a0 => 175
	i64 10321854143672141184, ; 379: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 297
	i64 10360651442923773544, ; 380: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 381: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 382: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 282
	i64 10406448008575299332, ; 383: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 303
	i64 10430153318873392755, ; 384: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 241
	i64 10454871586088267783, ; 385: DevExpress.Maui.DataGrid => 0x91172a50b51db007 => 185
	i64 10506226065143327199, ; 386: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 309
	i64 10546663366131771576, ; 387: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 388: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 389: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 390: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10678444886965028446, ; 391: DevExpress.Maui.Editors.dll => 0x9431750c4123065e => 186
	i64 10714184849103829812, ; 392: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10785150219063592792, ; 393: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10811915265162633087, ; 394: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 192
	i64 10822644899632537592, ; 395: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 396: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 397: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 226
	i64 10880838204485145808, ; 398: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 173
	i64 10899834349646441345, ; 399: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 400: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 401: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 11002576679268595294, ; 402: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 200
	i64 11009005086950030778, ; 403: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 207
	i64 11019817191295005410, ; 404: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 223
	i64 11023048688141570732, ; 405: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 406: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11071824625609515081, ; 407: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 295
	i64 11089314871468410253, ; 408: DevExpress.Maui.CollectionView => 0x99e5291f3454c58d => 178
	i64 11103970607964515343, ; 409: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 320
	i64 11136029745144976707, ; 410: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 293
	i64 11162124722117608902, ; 411: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 287
	i64 11188319605227840848, ; 412: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11220793807500858938, ; 413: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 323
	i64 11226290749488709958, ; 414: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 202
	i64 11235648312900863002, ; 415: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11329751333533450475, ; 416: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 417: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 243
	i64 11347436699239206956, ; 418: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 419: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 272
	i64 11432101114902388181, ; 420: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 421: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 422: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 423: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 424: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 253
	i64 11518296021396496455, ; 425: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 321
	i64 11529969570048099689, ; 426: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 287
	i64 11530571088791430846, ; 427: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 199
	i64 11580057168383206117, ; 428: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 221
	i64 11591352189662810718, ; 429: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 280
	i64 11597940890313164233, ; 430: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 431: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 254
	i64 11692977985522001935, ; 432: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 433: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 317
	i64 11707554492040141440, ; 434: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 435: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11991047634523762324, ; 436: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 437: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12063623837170009990, ; 438: System.Security => 0xa76a99f6ce740786 => 130
	i64 12075303808054746781, ; 439: Plugin.Maui.Audio.dll => 0xa79418d5f2065e9d => 211
	i64 12096697103934194533, ; 440: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 441: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 442: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 443: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 284
	i64 12145679461940342714, ; 444: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 445: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 215
	i64 12201331334810686224, ; 446: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 447: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12332222936682028543, ; 448: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12341818387765915815, ; 449: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 174
	i64 12375446203996702057, ; 450: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 451: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 252
	i64 12466513435562512481, ; 452: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 266
	i64 12475113361194491050, ; 453: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 345
	i64 12487638416075308985, ; 454: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 246
	i64 12517810545449516888, ; 455: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 456: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 234
	i64 12550732019250633519, ; 457: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12551451704392164662, ; 458: MySqlConnector.dll => 0xae2fb6d31fc42536 => 210
	i64 12681088699309157496, ; 459: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 322
	i64 12699999919562409296, ; 460: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 461: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 235
	i64 12708238894395270091, ; 462: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 463: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 464: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 465: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 289
	i64 12760970142902902754, ; 466: Xamarin.AndroidX.Camera.Lifecycle.dll => 0xb11812bc0517dfe2 => 232
	i64 12823819093633476069, ; 467: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 335
	i64 12828192437253469131, ; 468: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 301
	i64 12835242264250840079, ; 469: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 470: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 203
	i64 12843770487262409629, ; 471: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 472: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12963446364377008305, ; 473: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 214
	i64 12982280885948128408, ; 474: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 245
	i64 13041731019321118825, ; 475: Plugin.Maui.Audio => 0xb4fd894396d41069 => 211
	i64 13068258254871114833, ; 476: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13129914918964716986, ; 477: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 249
	i64 13173818576982874404, ; 478: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 479: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 309
	i64 13222659110913276082, ; 480: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 323
	i64 13236013933113115140, ; 481: DXScheduler.a => 0xb7afc48b75540204 => 187
	i64 13315587268572539134, ; 482: DevExpress.Maui.DataGrid.dll => 0xb8ca78125efae8fe => 185
	i64 13343850469010654401, ; 483: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 484: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 485: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 317
	i64 13401370062847626945, ; 486: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 284
	i64 13404347523447273790, ; 487: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 239
	i64 13431476299110033919, ; 488: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 489: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 296
	i64 13463706743370286408, ; 490: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 491: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 298
	i64 13467053111158216594, ; 492: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 337
	i64 13491513212026656886, ; 493: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 227
	i64 13540124433173649601, ; 494: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 338
	i64 13545416393490209236, ; 495: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 321
	i64 13572454107664307259, ; 496: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 274
	i64 13578472628727169633, ; 497: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 498: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 499: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 245
	i64 13647894001087880694, ; 500: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 501: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 220
	i64 13702626353344114072, ; 502: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 503: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 504: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 505: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 506: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 316
	i64 13768883594457632599, ; 507: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 508: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 319
	i64 13828521679616088467, ; 509: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 299
	i64 13869184409905670989, ; 510: DevExpress.Data.v24.1.dll => 0xc0793dbd1cd02b4d => 176
	i64 13881769479078963060, ; 511: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 512: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 513: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13959074834287824816, ; 514: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 252
	i64 14075334701871371868, ; 515: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14100563506285742564, ; 516: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 311
	i64 14124974489674258913, ; 517: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 234
	i64 14125464355221830302, ; 518: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14133832980772275001, ; 519: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 190
	i64 14178052285788134900, ; 520: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 216
	i64 14212104595480609394, ; 521: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 522: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 523: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 524: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 525: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 526: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 272
	i64 14298246716367104064, ; 527: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14316535876961222820, ; 528: Xamarin.AndroidX.Camera.Camera2 => 0xc6ae8d872068c0a4 => 230
	i64 14327695147300244862, ; 529: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 530: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 531: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 217
	i64 14346402571976470310, ; 532: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14461014870687870182, ; 533: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 534: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 332
	i64 14486659737292545672, ; 535: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 257
	i64 14495724990987328804, ; 536: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 275
	i64 14522721392235705434, ; 537: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 313
	i64 14551742072151931844, ; 538: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14556034074661724008, ; 539: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 174
	i64 14561513370130550166, ; 540: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 541: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14622043554576106986, ; 542: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 543: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 267
	i64 14653669531502871807, ; 544: DevExpress.Maui.Core.dll => 0xcb5c4acce93184ff => 183
	i64 14669215534098758659, ; 545: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 197
	i64 14690985099581930927, ; 546: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 547: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 324
	i64 14744092281598614090, ; 548: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 340
	i64 14792063746108907174, ; 549: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 296
	i64 14832630590065248058, ; 550: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14852515768018889994, ; 551: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 243
	i64 14889905118082851278, ; 552: GoogleGson.dll => 0xcea391d0969961ce => 189
	i64 14892012299694389861, ; 553: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 341
	i64 14904040806490515477, ; 554: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 308
	i64 14912225920358050525, ; 555: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 556: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 557: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 198
	i64 14984936317414011727, ; 558: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 559: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 560: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 246
	i64 15015154896917945444, ; 561: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 562: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15071021337266399595, ; 563: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 564: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 565: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 325
	i64 15115185479366240210, ; 566: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 567: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 568: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 273
	i64 15227001540531775957, ; 569: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 196
	i64 15234786388537674379, ; 570: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 571: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 572: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 236
	i64 15279429628684179188, ; 573: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 302
	i64 15299439993936780255, ; 574: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15338463749992804988, ; 575: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370334346939861994, ; 576: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 241
	i64 15391712275433856905, ; 577: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 198
	i64 15526743539506359484, ; 578: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 579: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 580: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 581: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 312
	i64 15541854775306130054, ; 582: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 583: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15582737692548360875, ; 584: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 265
	i64 15609085926864131306, ; 585: System.dll => 0xd89e9cf3334914ea => 164
	i64 15661133872274321916, ; 586: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 587: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 312
	i64 15710114879900314733, ; 588: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 589: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 320
	i64 15750144475371186037, ; 590: Xamarin.AndroidX.Camera.View.dll => 0xda93c0f3d794a775 => 233
	i64 15755368083429170162, ; 591: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 592: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 279
	i64 15783653065526199428, ; 593: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 313
	i64 15817206913877585035, ; 594: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15847085070278954535, ; 595: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 596: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 597: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 204
	i64 15934062614519587357, ; 598: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 599: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 600: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 601: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 602: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16054465462676478687, ; 603: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16154507427712707110, ; 604: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 605: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16274182383641215830, ; 606: zxing.dll => 0xe1d982a752dac356 => 304
	i64 16288847719894691167, ; 607: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 326
	i64 16315482530584035869, ; 608: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 609: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 200
	i64 16337011941688632206, ; 610: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 611: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 251
	i64 16423015068819898779, ; 612: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 301
	i64 16454459195343277943, ; 613: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 614: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16589693266713801121, ; 615: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 264
	i64 16621146507174665210, ; 616: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 238
	i64 16649148416072044166, ; 617: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 209
	i64 16677317093839702854, ; 618: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 271
	i64 16702652415771857902, ; 619: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 620: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 621: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 622: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 623: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 624: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16795178957077639253, ; 625: DXCore.a => 0xe9147646dbba7055 => 182
	i64 16822611501064131242, ; 626: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 627: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 628: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16885326587688996227, ; 629: ZXing.Net.MAUI.dll => 0xea54bb11b7a94d83 => 306
	i64 16890310621557459193, ; 630: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 631: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 632: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 333
	i64 16977952268158210142, ; 633: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 634: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 264
	i64 16998075588627545693, ; 635: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 269
	i64 17008137082415910100, ; 636: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 637: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 222
	i64 17026344819618783825, ; 638: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0xec49ba676cb0a251 => 344
	i64 17031351772568316411, ; 639: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 268
	i64 17037200463775726619, ; 640: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 255
	i64 17040771374769818752, ; 641: zxing => 0xec7cfb478bcccc80 => 304
	i64 17062143951396181894, ; 642: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 643: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 340
	i64 17118171214553292978, ; 644: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17187273293601214786, ; 645: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 646: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 647: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17230721278011714856, ; 648: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 649: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 650: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17306917412052548875, ; 651: ZXing.Net.MAUI => 0xf02e85b0b66a3d0b => 306
	i64 17333249706306540043, ; 652: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 653: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 654: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 318
	i64 17360349973592121190, ; 655: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 294
	i64 17438153253682247751, ; 656: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 333
	i64 17451281075798943988, ; 657: Pomelo.EntityFrameworkCore.MySql => 0xf22f67ad767e28f4 => 212
	i64 17470386307322966175, ; 658: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 659: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 660: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 316
	i64 17522591619082469157, ; 661: GoogleGson => 0xf32cc03d27a5bf25 => 189
	i64 17590473451926037903, ; 662: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 215
	i64 17623389608345532001, ; 663: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 328
	i64 17627500474728259406, ; 664: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 665: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 666: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 339
	i64 17704177640604968747, ; 667: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 266
	i64 17710060891934109755, ; 668: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 263
	i64 17712670374920797664, ; 669: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17777860260071588075, ; 670: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17802486580085668190, ; 671: DevExpress.Data.v24.1 => 0xf70f233914aa395e => 176
	i64 17838668724098252521, ; 672: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 673: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 297
	i64 17928294245072900555, ; 674: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17992315986609351877, ; 675: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18017743553296241350, ; 676: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 193
	i64 18025913125965088385, ; 677: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 678: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 327
	i64 18116111925905154859, ; 679: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 227
	i64 18121036031235206392, ; 680: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 268
	i64 18146411883821974900, ; 681: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 682: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18225059387460068507, ; 683: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 684: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 685: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 249
	i64 18305135509493619199, ; 686: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 270
	i64 18318849532986632368, ; 687: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 688: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 322
	i64 18335459783622540540, ; 689: ZXing.Net.MAUI.Controls => 0xfe74a3871c483cfc => 307
	i64 18380184030268848184, ; 690: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 286
	i64 18439108438687598470 ; 691: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [692 x i32] [
	i32 248, ; 0
	i32 212, ; 1
	i32 203, ; 2
	i32 171, ; 3
	i32 208, ; 4
	i32 58, ; 5
	i32 235, ; 6
	i32 151, ; 7
	i32 276, ; 8
	i32 279, ; 9
	i32 242, ; 10
	i32 132, ; 11
	i32 344, ; 12
	i32 56, ; 13
	i32 278, ; 14
	i32 315, ; 15
	i32 179, ; 16
	i32 95, ; 17
	i32 188, ; 18
	i32 261, ; 19
	i32 129, ; 20
	i32 214, ; 21
	i32 145, ; 22
	i32 236, ; 23
	i32 18, ; 24
	i32 318, ; 25
	i32 247, ; 26
	i32 262, ; 27
	i32 150, ; 28
	i32 104, ; 29
	i32 95, ; 30
	i32 291, ; 31
	i32 326, ; 32
	i32 186, ; 33
	i32 36, ; 34
	i32 28, ; 35
	i32 226, ; 36
	i32 179, ; 37
	i32 0, ; 38
	i32 269, ; 39
	i32 50, ; 40
	i32 115, ; 41
	i32 70, ; 42
	i32 205, ; 43
	i32 292, ; 44
	i32 65, ; 45
	i32 170, ; 46
	i32 145, ; 47
	i32 324, ; 48
	i32 290, ; 49
	i32 225, ; 50
	i32 265, ; 51
	i32 255, ; 52
	i32 40, ; 53
	i32 89, ; 54
	i32 81, ; 55
	i32 66, ; 56
	i32 62, ; 57
	i32 86, ; 58
	i32 224, ; 59
	i32 106, ; 60
	i32 314, ; 61
	i32 276, ; 62
	i32 102, ; 63
	i32 35, ; 64
	i32 221, ; 65
	i32 336, ; 66
	i32 278, ; 67
	i32 228, ; 68
	i32 206, ; 69
	i32 336, ; 70
	i32 119, ; 71
	i32 263, ; 72
	i32 310, ; 73
	i32 328, ; 74
	i32 142, ; 75
	i32 141, ; 76
	i32 300, ; 77
	i32 53, ; 78
	i32 35, ; 79
	i32 141, ; 80
	i32 230, ; 81
	i32 218, ; 82
	i32 229, ; 83
	i32 191, ; 84
	i32 201, ; 85
	i32 181, ; 86
	i32 247, ; 87
	i32 8, ; 88
	i32 14, ; 89
	i32 332, ; 90
	i32 275, ; 91
	i32 51, ; 92
	i32 258, ; 93
	i32 136, ; 94
	i32 101, ; 95
	i32 240, ; 96
	i32 285, ; 97
	i32 116, ; 98
	i32 219, ; 99
	i32 163, ; 100
	i32 335, ; 101
	i32 166, ; 102
	i32 67, ; 103
	i32 197, ; 104
	i32 310, ; 105
	i32 80, ; 106
	i32 305, ; 107
	i32 101, ; 108
	i32 280, ; 109
	i32 117, ; 110
	i32 177, ; 111
	i32 315, ; 112
	i32 293, ; 113
	i32 0, ; 114
	i32 78, ; 115
	i32 291, ; 116
	i32 343, ; 117
	i32 114, ; 118
	i32 121, ; 119
	i32 48, ; 120
	i32 128, ; 121
	i32 256, ; 122
	i32 222, ; 123
	i32 82, ; 124
	i32 110, ; 125
	i32 75, ; 126
	i32 303, ; 127
	i32 228, ; 128
	i32 208, ; 129
	i32 53, ; 130
	i32 282, ; 131
	i32 195, ; 132
	i32 69, ; 133
	i32 281, ; 134
	i32 194, ; 135
	i32 83, ; 136
	i32 172, ; 137
	i32 330, ; 138
	i32 116, ; 139
	i32 196, ; 140
	i32 156, ; 141
	i32 195, ; 142
	i32 216, ; 143
	i32 167, ; 144
	i32 274, ; 145
	i32 248, ; 146
	i32 199, ; 147
	i32 32, ; 148
	i32 206, ; 149
	i32 122, ; 150
	i32 72, ; 151
	i32 62, ; 152
	i32 161, ; 153
	i32 113, ; 154
	i32 88, ; 155
	i32 204, ; 156
	i32 341, ; 157
	i32 183, ; 158
	i32 105, ; 159
	i32 18, ; 160
	i32 146, ; 161
	i32 118, ; 162
	i32 58, ; 163
	i32 242, ; 164
	i32 17, ; 165
	i32 52, ; 166
	i32 92, ; 167
	i32 343, ; 168
	i32 338, ; 169
	i32 182, ; 170
	i32 55, ; 171
	i32 178, ; 172
	i32 342, ; 173
	i32 129, ; 174
	i32 184, ; 175
	i32 152, ; 176
	i32 41, ; 177
	i32 192, ; 178
	i32 92, ; 179
	i32 191, ; 180
	i32 286, ; 181
	i32 187, ; 182
	i32 50, ; 183
	i32 308, ; 184
	i32 162, ; 185
	i32 232, ; 186
	i32 13, ; 187
	i32 260, ; 188
	i32 175, ; 189
	i32 219, ; 190
	i32 281, ; 191
	i32 36, ; 192
	i32 67, ; 193
	i32 109, ; 194
	i32 220, ; 195
	i32 99, ; 196
	i32 99, ; 197
	i32 11, ; 198
	i32 11, ; 199
	i32 267, ; 200
	i32 25, ; 201
	i32 128, ; 202
	i32 76, ; 203
	i32 259, ; 204
	i32 109, ; 205
	i32 285, ; 206
	i32 283, ; 207
	i32 106, ; 208
	i32 2, ; 209
	i32 26, ; 210
	i32 238, ; 211
	i32 157, ; 212
	i32 334, ; 213
	i32 21, ; 214
	i32 337, ; 215
	i32 49, ; 216
	i32 43, ; 217
	i32 126, ; 218
	i32 223, ; 219
	i32 59, ; 220
	i32 213, ; 221
	i32 119, ; 222
	i32 288, ; 223
	i32 251, ; 224
	i32 237, ; 225
	i32 3, ; 226
	i32 257, ; 227
	i32 277, ; 228
	i32 38, ; 229
	i32 124, ; 230
	i32 331, ; 231
	i32 277, ; 232
	i32 331, ; 233
	i32 137, ; 234
	i32 149, ; 235
	i32 85, ; 236
	i32 90, ; 237
	i32 261, ; 238
	i32 345, ; 239
	i32 258, ; 240
	i32 319, ; 241
	i32 229, ; 242
	i32 305, ; 243
	i32 244, ; 244
	i32 289, ; 245
	i32 202, ; 246
	i32 295, ; 247
	i32 259, ; 248
	i32 133, ; 249
	i32 96, ; 250
	i32 3, ; 251
	i32 327, ; 252
	i32 105, ; 253
	i32 330, ; 254
	i32 33, ; 255
	i32 154, ; 256
	i32 158, ; 257
	i32 155, ; 258
	i32 82, ; 259
	i32 307, ; 260
	i32 253, ; 261
	i32 188, ; 262
	i32 143, ; 263
	i32 87, ; 264
	i32 19, ; 265
	i32 254, ; 266
	i32 51, ; 267
	i32 180, ; 268
	i32 218, ; 269
	i32 334, ; 270
	i32 177, ; 271
	i32 61, ; 272
	i32 54, ; 273
	i32 4, ; 274
	i32 97, ; 275
	i32 217, ; 276
	i32 17, ; 277
	i32 155, ; 278
	i32 84, ; 279
	i32 29, ; 280
	i32 45, ; 281
	i32 64, ; 282
	i32 66, ; 283
	i32 210, ; 284
	i32 325, ; 285
	i32 172, ; 286
	i32 262, ; 287
	i32 1, ; 288
	i32 298, ; 289
	i32 292, ; 290
	i32 181, ; 291
	i32 47, ; 292
	i32 24, ; 293
	i32 225, ; 294
	i32 193, ; 295
	i32 165, ; 296
	i32 108, ; 297
	i32 12, ; 298
	i32 256, ; 299
	i32 63, ; 300
	i32 27, ; 301
	i32 23, ; 302
	i32 93, ; 303
	i32 168, ; 304
	i32 12, ; 305
	i32 302, ; 306
	i32 209, ; 307
	i32 29, ; 308
	i32 103, ; 309
	i32 14, ; 310
	i32 233, ; 311
	i32 126, ; 312
	i32 239, ; 313
	i32 271, ; 314
	i32 91, ; 315
	i32 260, ; 316
	i32 9, ; 317
	i32 86, ; 318
	i32 250, ; 319
	i32 173, ; 320
	i32 283, ; 321
	i32 329, ; 322
	i32 71, ; 323
	i32 168, ; 324
	i32 231, ; 325
	i32 1, ; 326
	i32 270, ; 327
	i32 5, ; 328
	i32 329, ; 329
	i32 44, ; 330
	i32 27, ; 331
	i32 299, ; 332
	i32 158, ; 333
	i32 273, ; 334
	i32 112, ; 335
	i32 339, ; 336
	i32 194, ; 337
	i32 231, ; 338
	i32 121, ; 339
	i32 190, ; 340
	i32 288, ; 341
	i32 224, ; 342
	i32 213, ; 343
	i32 159, ; 344
	i32 180, ; 345
	i32 131, ; 346
	i32 294, ; 347
	i32 57, ; 348
	i32 138, ; 349
	i32 83, ; 350
	i32 30, ; 351
	i32 240, ; 352
	i32 10, ; 353
	i32 290, ; 354
	i32 171, ; 355
	i32 237, ; 356
	i32 150, ; 357
	i32 94, ; 358
	i32 250, ; 359
	i32 60, ; 360
	i32 207, ; 361
	i32 157, ; 362
	i32 314, ; 363
	i32 201, ; 364
	i32 64, ; 365
	i32 88, ; 366
	i32 79, ; 367
	i32 184, ; 368
	i32 47, ; 369
	i32 205, ; 370
	i32 143, ; 371
	i32 311, ; 372
	i32 300, ; 373
	i32 244, ; 374
	i32 74, ; 375
	i32 91, ; 376
	i32 342, ; 377
	i32 175, ; 378
	i32 297, ; 379
	i32 135, ; 380
	i32 90, ; 381
	i32 282, ; 382
	i32 303, ; 383
	i32 241, ; 384
	i32 185, ; 385
	i32 309, ; 386
	i32 112, ; 387
	i32 42, ; 388
	i32 159, ; 389
	i32 4, ; 390
	i32 186, ; 391
	i32 103, ; 392
	i32 70, ; 393
	i32 192, ; 394
	i32 60, ; 395
	i32 39, ; 396
	i32 226, ; 397
	i32 173, ; 398
	i32 153, ; 399
	i32 56, ; 400
	i32 34, ; 401
	i32 200, ; 402
	i32 207, ; 403
	i32 223, ; 404
	i32 21, ; 405
	i32 163, ; 406
	i32 295, ; 407
	i32 178, ; 408
	i32 320, ; 409
	i32 293, ; 410
	i32 287, ; 411
	i32 140, ; 412
	i32 323, ; 413
	i32 202, ; 414
	i32 89, ; 415
	i32 147, ; 416
	i32 243, ; 417
	i32 162, ; 418
	i32 272, ; 419
	i32 6, ; 420
	i32 169, ; 421
	i32 31, ; 422
	i32 107, ; 423
	i32 253, ; 424
	i32 321, ; 425
	i32 287, ; 426
	i32 199, ; 427
	i32 221, ; 428
	i32 280, ; 429
	i32 167, ; 430
	i32 254, ; 431
	i32 140, ; 432
	i32 317, ; 433
	i32 59, ; 434
	i32 144, ; 435
	i32 81, ; 436
	i32 74, ; 437
	i32 130, ; 438
	i32 211, ; 439
	i32 25, ; 440
	i32 7, ; 441
	i32 93, ; 442
	i32 284, ; 443
	i32 137, ; 444
	i32 215, ; 445
	i32 113, ; 446
	i32 9, ; 447
	i32 104, ; 448
	i32 174, ; 449
	i32 19, ; 450
	i32 252, ; 451
	i32 266, ; 452
	i32 345, ; 453
	i32 246, ; 454
	i32 33, ; 455
	i32 234, ; 456
	i32 46, ; 457
	i32 210, ; 458
	i32 322, ; 459
	i32 30, ; 460
	i32 235, ; 461
	i32 57, ; 462
	i32 134, ; 463
	i32 114, ; 464
	i32 289, ; 465
	i32 232, ; 466
	i32 335, ; 467
	i32 301, ; 468
	i32 55, ; 469
	i32 203, ; 470
	i32 6, ; 471
	i32 77, ; 472
	i32 214, ; 473
	i32 245, ; 474
	i32 211, ; 475
	i32 111, ; 476
	i32 249, ; 477
	i32 102, ; 478
	i32 309, ; 479
	i32 323, ; 480
	i32 187, ; 481
	i32 185, ; 482
	i32 170, ; 483
	i32 115, ; 484
	i32 317, ; 485
	i32 284, ; 486
	i32 239, ; 487
	i32 76, ; 488
	i32 296, ; 489
	i32 85, ; 490
	i32 298, ; 491
	i32 337, ; 492
	i32 227, ; 493
	i32 338, ; 494
	i32 321, ; 495
	i32 274, ; 496
	i32 160, ; 497
	i32 2, ; 498
	i32 245, ; 499
	i32 24, ; 500
	i32 220, ; 501
	i32 32, ; 502
	i32 117, ; 503
	i32 37, ; 504
	i32 16, ; 505
	i32 316, ; 506
	i32 52, ; 507
	i32 319, ; 508
	i32 299, ; 509
	i32 176, ; 510
	i32 20, ; 511
	i32 123, ; 512
	i32 154, ; 513
	i32 252, ; 514
	i32 131, ; 515
	i32 311, ; 516
	i32 234, ; 517
	i32 148, ; 518
	i32 190, ; 519
	i32 216, ; 520
	i32 120, ; 521
	i32 28, ; 522
	i32 132, ; 523
	i32 100, ; 524
	i32 134, ; 525
	i32 272, ; 526
	i32 153, ; 527
	i32 230, ; 528
	i32 97, ; 529
	i32 125, ; 530
	i32 217, ; 531
	i32 69, ; 532
	i32 72, ; 533
	i32 332, ; 534
	i32 257, ; 535
	i32 275, ; 536
	i32 313, ; 537
	i32 136, ; 538
	i32 174, ; 539
	i32 124, ; 540
	i32 71, ; 541
	i32 111, ; 542
	i32 267, ; 543
	i32 183, ; 544
	i32 197, ; 545
	i32 152, ; 546
	i32 324, ; 547
	i32 340, ; 548
	i32 296, ; 549
	i32 118, ; 550
	i32 243, ; 551
	i32 189, ; 552
	i32 341, ; 553
	i32 308, ; 554
	i32 127, ; 555
	i32 133, ; 556
	i32 198, ; 557
	i32 77, ; 558
	i32 46, ; 559
	i32 246, ; 560
	i32 73, ; 561
	i32 63, ; 562
	i32 98, ; 563
	i32 84, ; 564
	i32 325, ; 565
	i32 43, ; 566
	i32 61, ; 567
	i32 273, ; 568
	i32 196, ; 569
	i32 37, ; 570
	i32 40, ; 571
	i32 236, ; 572
	i32 302, ; 573
	i32 160, ; 574
	i32 98, ; 575
	i32 241, ; 576
	i32 198, ; 577
	i32 135, ; 578
	i32 20, ; 579
	i32 65, ; 580
	i32 312, ; 581
	i32 125, ; 582
	i32 75, ; 583
	i32 265, ; 584
	i32 164, ; 585
	i32 156, ; 586
	i32 312, ; 587
	i32 5, ; 588
	i32 320, ; 589
	i32 233, ; 590
	i32 49, ; 591
	i32 279, ; 592
	i32 313, ; 593
	i32 144, ; 594
	i32 139, ; 595
	i32 100, ; 596
	i32 204, ; 597
	i32 123, ; 598
	i32 120, ; 599
	i32 142, ; 600
	i32 39, ; 601
	i32 68, ; 602
	i32 41, ; 603
	i32 164, ; 604
	i32 73, ; 605
	i32 304, ; 606
	i32 326, ; 607
	i32 165, ; 608
	i32 200, ; 609
	i32 127, ; 610
	i32 251, ; 611
	i32 301, ; 612
	i32 68, ; 613
	i32 169, ; 614
	i32 264, ; 615
	i32 238, ; 616
	i32 209, ; 617
	i32 271, ; 618
	i32 151, ; 619
	i32 45, ; 620
	i32 108, ; 621
	i32 48, ; 622
	i32 96, ; 623
	i32 31, ; 624
	i32 182, ; 625
	i32 23, ; 626
	i32 166, ; 627
	i32 22, ; 628
	i32 306, ; 629
	i32 138, ; 630
	i32 78, ; 631
	i32 333, ; 632
	i32 54, ; 633
	i32 264, ; 634
	i32 269, ; 635
	i32 10, ; 636
	i32 222, ; 637
	i32 344, ; 638
	i32 268, ; 639
	i32 255, ; 640
	i32 304, ; 641
	i32 16, ; 642
	i32 340, ; 643
	i32 139, ; 644
	i32 13, ; 645
	i32 15, ; 646
	i32 122, ; 647
	i32 87, ; 648
	i32 149, ; 649
	i32 22, ; 650
	i32 306, ; 651
	i32 34, ; 652
	i32 79, ; 653
	i32 318, ; 654
	i32 294, ; 655
	i32 333, ; 656
	i32 212, ; 657
	i32 147, ; 658
	i32 80, ; 659
	i32 316, ; 660
	i32 189, ; 661
	i32 215, ; 662
	i32 328, ; 663
	i32 42, ; 664
	i32 26, ; 665
	i32 339, ; 666
	i32 266, ; 667
	i32 263, ; 668
	i32 107, ; 669
	i32 110, ; 670
	i32 176, ; 671
	i32 7, ; 672
	i32 297, ; 673
	i32 44, ; 674
	i32 161, ; 675
	i32 193, ; 676
	i32 148, ; 677
	i32 327, ; 678
	i32 227, ; 679
	i32 268, ; 680
	i32 38, ; 681
	i32 15, ; 682
	i32 146, ; 683
	i32 8, ; 684
	i32 249, ; 685
	i32 270, ; 686
	i32 130, ; 687
	i32 322, ; 688
	i32 307, ; 689
	i32 286, ; 690
	i32 94 ; 691
], align 4

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
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}

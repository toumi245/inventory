package crc646b09977338b7360e;


public class DXBottomSheetDialog_ContentContainer
	extends android.view.ViewGroup
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onLayout:(ZIIII)V:GetOnLayout_ZIIIIHandler\n" +
			"n_onMeasure:(II)V:GetOnMeasure_IIHandler\n" +
			"";
		mono.android.Runtime.register ("DevExpress.Maui.Controls.Internal.DXBottomSheetDialog+ContentContainer, DevExpress.Maui.Controls", DXBottomSheetDialog_ContentContainer.class, __md_methods);
	}


	public DXBottomSheetDialog_ContentContainer (android.content.Context p0, android.util.AttributeSet p1, int p2, int p3)
	{
		super (p0, p1, p2, p3);
		if (getClass () == DXBottomSheetDialog_ContentContainer.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Controls.Internal.DXBottomSheetDialog+ContentContainer, DevExpress.Maui.Controls", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, System.Private.CoreLib:System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2, p3 });
		}
	}


	public DXBottomSheetDialog_ContentContainer (android.content.Context p0, android.util.AttributeSet p1, int p2)
	{
		super (p0, p1, p2);
		if (getClass () == DXBottomSheetDialog_ContentContainer.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Controls.Internal.DXBottomSheetDialog+ContentContainer, DevExpress.Maui.Controls", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2 });
		}
	}


	public DXBottomSheetDialog_ContentContainer (android.content.Context p0, android.util.AttributeSet p1)
	{
		super (p0, p1);
		if (getClass () == DXBottomSheetDialog_ContentContainer.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Controls.Internal.DXBottomSheetDialog+ContentContainer, DevExpress.Maui.Controls", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}


	public DXBottomSheetDialog_ContentContainer (android.content.Context p0)
	{
		super (p0);
		if (getClass () == DXBottomSheetDialog_ContentContainer.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Controls.Internal.DXBottomSheetDialog+ContentContainer, DevExpress.Maui.Controls", "Android.Content.Context, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}


	public void onLayout (boolean p0, int p1, int p2, int p3, int p4)
	{
		n_onLayout (p0, p1, p2, p3, p4);
	}

	private native void n_onLayout (boolean p0, int p1, int p2, int p3, int p4);


	public void onMeasure (int p0, int p1)
	{
		n_onMeasure (p0, p1);
	}

	private native void n_onMeasure (int p0, int p1);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}

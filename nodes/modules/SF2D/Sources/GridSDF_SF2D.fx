
////////////////////////////////////////////////////////////////////////////////////////////////
//
//		Grid Distance Functions
//
////////////////////////////////////////////////////////////////////////////////////////////////
// This token will be replaced with function name via RegExpr: "FN_"

// ensures the function is defined only once per instance
#ifndef FN_BODY 
#define FN_BODY

#ifndef SDF_FXH
#include <packs\happy.fxh\sdf.fxh>
#endif

// DEFINES
#ifndef LATTICEFUNC
#define LATTICEFUNC fBoxGrid 
#endif





// paramaters
float FN_freq : FN_FREQ = 2; 
float FN_width : FN_WIDTH = .1; 
float2 FN_offset : FN_OFFSET;

int FN_count : FN_COUNT;


// Input SF2D function placeholder
#ifndef FN_INPUTFREQ
float FN_FreqDefualt(float2 p)
{
	return FN_freq;
}
#define FN_INPUTFREQ FN_FreqDefualt
#endif


// Input SF2D function placeholder
#ifndef FN_INPUTWIDTH
float FN_widthDefualt(float2 p)
{
	return FN_width;
}
#define FN_INPUTWIDTH FN_widthDefualt
#endif

float FN_ (float2 p)
{
	float freq = FN_INPUTFREQ(p);
	float width = FN_INPUTWIDTH(p);
	return LATTICEFUNC(p * freq + FN_offset, width) / freq;
}
// end of the function body
#endif 

////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef SF2D
#define SF2D FN_
#endif
////////////////////////////////////////////////////////////////////////////////////////////////

technique11 RemoveMe{}


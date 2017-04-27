//--------------------------------
//constant buffer struct
//--------------------------------
struct Matrix
{
	matrix world;
	matrix view;
	matrix proj;
};

struct Voxel
{
	float3 offset;
	float dimension;
	float size;
};

struct Common
{
	float3 eyeposW;
	float time;
};

//-----------------------------------------------
// DepthStencilState for disabling depth writing.
//-------------------------------------------
DepthStencilState DisableDepth
{
	DepthEnable = FALSE;
	DepthWriteMask = 0;
};

//-----------------------------------------------
// RasterizerState
//-------------------------------------------
RasterizerState SolidRS
{
	FillMode = SOLID;	//WIREFRAME
	CullMode = NONE;
	FrontCounterClockwise = false;
};

//--------------------------------------------
//BlendState for disabling blending.
//--------------------------------------------
BlendState NoBlending
{
	AlphaToCoverageEnable = FALSE;
	BlendEnable[0] = FALSE;
};

//-----------------------------------------------------------------------------------------
// Default Sampler.
//-----------------------------------------------------------------------------------------
SamplerState SVOFilter
{
	//Filter = ANISOTROPIC;
	//MaxAnisotropy = 0;
	//MipMapLevelOfDetailBias=0;
};

//-----------------------------------------------------------------------------------------
//voxel coordinate	: (0,voxel_dimension)
//-----------------------------------------------------------------------------------------
float3 world_to_svo(float3 posW,float voxel_size,float3 offset)
{
	float3 pos=posW;
	pos=((pos+offset)/voxel_size);
	//pos.z -= 0.001;
	return pos;
}

float3 svo_to_world(float3 posW,float voxel_size,float3 offset)
{
	float3 pos=posW;

	pos*=voxel_size;
	pos-=offset;
	return pos;
}

//-----------------------------------------------------------------------------------------
// map from -1,1 to 0,1
//-----------------------------------------------------------------------------------------
float map(float from)
{
	return float(0.5f*from+0.5f);
}

//-----------------------------------------------------------------------------------------
// get orthogonal vector
//-----------------------------------------------------------------------------------------
float3 orthogonal(float3 u){
	float3 v = float3(0.577, 0.577, 0.577); 
	return abs(dot(u, v)) > 0.99999f ? cross(u, float3(1, 0, 0)) : cross(u, v);
}
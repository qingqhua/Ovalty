#ifndef VOXEL_VISUAL_H
#define VOXEL_VISUAL_H

#include <DirectXMath.h>
#include "Core/d3dApp.h"

class Visualizer
{
public:
	Visualizer();
	~Visualizer();

	void Init(ID3D11Device* device, ID3D11DeviceContext* deviceContext, float res);
	void SetMatrix(const DirectX::XMMATRIX* world, const DirectX::XMMATRIX * worldInverTrans, const DirectX::XMMATRIX* view, const DirectX::XMMATRIX * proj);
	void Render(ID3D11ShaderResourceView* voxelList, float voxelsize, DirectX::XMFLOAT3 voxeloffset, float t);
	void updateGUICB(int MODE, float res);
private:
	void BuildFX();

private:

	//input var
	ID3D11Device* md3dDevice;
	ID3D11DeviceContext* mDeviceContext;
	ID3D11InputLayout* mInputLayout;

	//effect var
	ID3DX11Effect* mFX;
	ID3DX11EffectTechnique* mTech;

	ID3DX11EffectMatrixVariable* mfxView;
	ID3DX11EffectMatrixVariable* mfxProj;
	ID3DX11EffectMatrixVariable* mfxWorld;
	ID3DX11EffectMatrixVariable* mfxWorldInverTrans;

	ID3DX11EffectScalarVariable* mfxTime;

	ID3DX11EffectScalarVariable* mfxMODE;
	ID3DX11EffectScalarVariable* mfxVoxelSize;
	ID3DX11EffectVectorVariable* mfxVoxelOffset;
	ID3DX11EffectScalarVariable* mfxDim;
	ID3DX11EffectShaderResourceVariable* mfxVoxelList;

	float mRes;
};

#endif // VOXEL_VISUAL_H
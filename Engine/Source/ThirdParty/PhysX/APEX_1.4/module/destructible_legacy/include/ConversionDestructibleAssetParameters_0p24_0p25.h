/*
 * Copyright (c) 2008-2017, NVIDIA CORPORATION.  All rights reserved.
 *
 * NVIDIA CORPORATION and its licensors retain all intellectual property
 * and proprietary rights in and to this software, related documentation
 * and any modifications thereto.  Any use, reproduction, disclosure or
 * distribution of this software and related documentation without an express
 * license agreement from NVIDIA CORPORATION is strictly prohibited.
 */


#ifndef MODULE_CONVERSIONDESTRUCTIBLEASSETPARAMETERS_0P24_0P25H_H
#define MODULE_CONVERSIONDESTRUCTIBLEASSETPARAMETERS_0P24_0P25H_H

#include "NvParamConversionTemplate.h"
#include "DestructibleAssetParameters_0p24.h"
#include "DestructibleAssetParameters_0p25.h"

namespace nvidia {
namespace apex {
namespace legacy {


typedef NvParameterized::ParamConversionTemplate<nvidia::parameterized::DestructibleAssetParameters_0p24, 
						nvidia::parameterized::DestructibleAssetParameters_0p25, 
						nvidia::parameterized::DestructibleAssetParameters_0p24::ClassVersion, 
						nvidia::parameterized::DestructibleAssetParameters_0p25::ClassVersion>
						ConversionDestructibleAssetParameters_0p24_0p25Parent;

class ConversionDestructibleAssetParameters_0p24_0p25: public ConversionDestructibleAssetParameters_0p24_0p25Parent
{
public:
	static NvParameterized::Conversion* Create(NvParameterized::Traits* t)
	{
		void* buf = t->alloc(sizeof(ConversionDestructibleAssetParameters_0p24_0p25));
		return buf ? PX_PLACEMENT_NEW(buf, ConversionDestructibleAssetParameters_0p24_0p25)(t) : 0;
	}

protected:
	ConversionDestructibleAssetParameters_0p24_0p25(NvParameterized::Traits* t) : ConversionDestructibleAssetParameters_0p24_0p25Parent(t) {}

	const NvParameterized::PrefVer* getPreferredVersions() const
	{
		static NvParameterized::PrefVer prefVers[] =
		{
			//TODO:
			//	Add your preferred versions for included references here.
			//	Entry format is
			//		{ (const char*)longName, (PxU32)preferredVersion }

			{ 0, 0 } // Terminator (do not remove!)
		};

		return prefVers;
	}

	bool convert()
	{
		//TODO:
		//	Write custom conversion code here using mNewData and mLegacyData members.
		//
		//	Note that
		//		- mNewData has already been initialized with default values
		//		- same-named/same-typed members have already been copied
		//			from mLegacyData to mNewData
		//		- included references were moved to mNewData
		//			(and updated to preferred versions according to getPreferredVersions)
		//
		//	For more info see the versioning wiki.
		for (int i = 0; i < mLegacyData->scatterMeshTransforms.arraySizes[0]; ++i)
		{
			mNewData->scatterMeshTransforms.buf[i] = physx::PxMat44(mLegacyData->scatterMeshTransforms.buf[i].matrix, 
																	mLegacyData->scatterMeshTransforms.buf[i].vector);
		}
		return true;
	}
};


}
}
} //nvidia::apex::legacy

#endif

//
//  BBMetalBrightnessFilter.metal
//  BBMetalImage
//
//  Created by Kaibo Lu on 4/2/19.
//  Copyright © 2019 Kaibo Lu. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void brightnessKernel(texture2d<half, access::read> inputTexture [[texture(0)]],
                             texture2d<half, access::write> outputTexture [[texture(1)]],
                             device float *brightness [[buffer(0)]],
                             uint2 gid [[thread_position_in_grid]]) {
    
    const half4 inColor = inputTexture.read(gid);
    const half4 outColor(inColor.rgb + half3(*brightness), inColor.a);
    outputTexture.write(outColor, gid);
}
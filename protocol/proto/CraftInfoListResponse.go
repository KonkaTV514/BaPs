// Code generated by gucooing DO NOT EDIT.

package proto

import (
	"encoding/json"

	"github.com/gucooing/BaPs/pkg/mx"
)

type CraftInfoListResponse struct{
	message ProtoMessage
	ResponsePacket

    CraftInfos []*CraftInfoDB
    ShiftingCraftInfos []*ShiftingCraftInfoDB
}

func (x *CraftInfoListResponse) String() string {
	j, _ := json.Marshal(x)
	return string(j)
}

func (x *CraftInfoListResponse) ProtoReflect() Message {
	return x
}

func (x *CraftInfoListResponse) GetProtocol() int32 {
	return mx.Protocol_Craft_List
}

func (x *CraftInfoListResponse) SetSessionKey(base *BasePacket) {
	if x == nil {
		return
	}
	x.BasePacket = base
}


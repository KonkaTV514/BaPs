// Code generated by gucooing DO NOT EDIT.

package proto

import (
	"encoding/json"

	"github.com/gucooing/BaPs/pkg/mx"
)

type FriendRemoveRequest struct{
	message ProtoMessage
	RequestPacket

    TargetAccountId int64
}

func (x *FriendRemoveRequest) String() string {
	j, _ := json.Marshal(x)
	return string(j)
}

func (x *FriendRemoveRequest) ProtoReflect() Message {
	return x
}

func (x *FriendRemoveRequest) GetProtocol() int32 {
	return mx.Protocol_Friend_Remove
}

func (x *FriendRemoveRequest) SetSessionKey(base *BasePacket) {
	if x == nil {
		return
	}
	x.BasePacket = base
}


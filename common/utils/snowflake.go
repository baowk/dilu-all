package utils

import "github.com/bwmarrin/snowflake"

var node *snowflake.Node

// 系统start设置了节点id，不需要二次初始化
func Setup(nodeId int64) error {
	var err error
	node, err = snowflake.NewNode(nodeId)
	return err
}
func GenInt() int64 {
	return node.Generate().Int64()
}

func GenString() string {
	return node.Generate().String()
}

func Gen() snowflake.ID {
	return node.Generate()
}

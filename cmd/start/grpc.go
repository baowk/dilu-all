// grpc开启服务与grpc初始化
package start

import (
	"dilu/common/config"
	"fmt"
	"log"
	"net"

	"github.com/baowk/dilu-core/common/utils/text"
	"github.com/baowk/dilu-core/core"
	"github.com/baowk/dilu-rd/examples/reg/impl"
	"github.com/baowk/dilu-rd/grpc/pb/health"
	"github.com/baowk/dilu-rd/grpc/pb/service"
	"google.golang.org/grpc"
)

var grpcServer *grpc.Server

func grpcInit() {
	grpcServer = grpc.NewServer()
	//注册grpc服务
	health.RegisterHealthServer(grpcServer, &health.HealthServerImpl{})
	service.RegisterGreeterServer(grpcServer, &impl.TempimplementedGreeterServer{})

	//注册服务完成
	grpcAddr := fmt.Sprintf("%s:%d", config.Get().GrpcServer.GetHost(), config.Get().GrpcServer.GetPort())
	lis, err := net.Listen("tcp", grpcAddr)
	if err != nil {
		core.GetApp().GetLogger().Error("failed to listen", err)
		log.Fatal("failed to listen:", err)
	}
	go func() {
		if err := grpcServer.Serve(lis); err != nil {
			core.GetApp().GetLogger().Error("failed to serve", err)
			log.Fatal("failed to serve:", err)
		}
	}()
	fmt.Println(text.Green("Dilu GRPC Server started ,Listen: ") + text.Red("[ "+grpcAddr+" ]"))
}

func closeGrpc() {
	grpcServer.GracefulStop()
}

package job

import (
	"fmt"

	"github.com/baowk/dilu-core/core"
	"github.com/robfig/cron/v3"
)

var c = cron.New(cron.WithSeconds())

func Add(spec string, cmd func()) {
	_, err := c.AddFunc(spec, cmd)
	if err != nil {
		core.Log.Error("job start err", err)
	}
}

func Start() {
	c.Start()
}

func Stop() {
	c.Stop()
}

func Remove(id int) {
	c.Remove(cron.EntryID(id))
}

func Jobs() []cron.Entry {
	return c.Entries()
}

func DemoTask() {
	fmt.Println("Haha")
}

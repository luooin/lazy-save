<template>
  <div style="margin-bottom: 100px">
    <div style="margin: 20px 0">
      <div style="font-size: 28px; margin: 10px 0">{{ plan.name }}
        <span style="font-size:20px;color: orangered; margin-left: 20px">￥ {{ plan.total }}</span></div>
    </div>
    <div style="margin: 10px 0; color: #666">
      <span>已存入：{{ plan.moneyIn }} 元</span>
    </div>
    <div style="margin: 10px 0;">
      <el-progress :percentage="parseFloat((plan.moneyIn / plan.total * 100).toFixed(1))" v-if="plan.moneyIn && plan.total"></el-progress>
    </div>
    <div style="margin: 20px 0">
      <el-button v-if="!flag" size="medium" type="primary" @click="save">存一笔 <i class="el-icon-coin"></i></el-button>
      <el-popconfirm
          v-else
          title="今天已经存过了，确定再存一笔吗？"
          @confirm="save"
      >
        <el-button size="medium" slot="reference" type="primary" >存一笔 <i class="el-icon-coin"></i></el-button>
      </el-popconfirm>
    </div>

    <div style="margin: 20px 0; display: flex;  flex-wrap: wrap;">
      <div v-for="item in tableData" :key="item.id" style="width: 48%; background-color: AliceBlue; margin-bottom: 10px" class="item1">
        <div style="border-radius: 10px; padding: 10px; overflow: hidden; border: 1px solid #ccc;" >
          <div style="margin: 10px; font-size: 20px;">存入 ￥ {{ item.money }}
            <span style="margin-left: 20px; font-size: 14px; color: #1E90FF">累计 ￥ {{ item.total }}</span></div>
          <div style="margin: 10px;font-size: 14px; color: #666">{{ item.date }}</div>
        </div>
      </div>
    </div>


    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="30%" :close-on-click-modal="false">
      <el-form label-width="100px" size="small" style="width: 90%">
        <el-form-item label="计划id">
          <el-input v-model="form.planId" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="金额">
          <el-input v-model="form.money" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="累计金额">
          <el-input v-model="form.total" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="日期">
          <el-date-picker v-model="form.date" type="date" value-format="yyyy-MM-dd" placeholder="选择日期"></el-date-picker>
        </el-form-item>
        <el-form-item label="创建人">
          <el-input v-model="form.user" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "PlanItem",
  data() {
    return {
      id: this.$route.query.id,
      plan: {},
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      flag: false
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/plan/" + this.id).then(res => {
        this.plan = res.data
      })
      this.request.get("/planItem/page/front", {
        params: {
          planId: this.id
        }
      }).then(res => {
        this.tableData = res.data
      })
    },
    save() {
      this.form = { planId: this.id, money: this.plan.money}
      this.request.post("/planItem", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("存款成功")
          this.dialogFormVisible = false
          this.flag = true
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.$nextTick(() => {
        if (this.$refs.img) {
          this.$refs.img.clearFiles();
        }
        if (this.$refs.file) {
          this.$refs.file.clearFiles();
        }
      })
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
      this.$nextTick(() => {
        if (this.$refs.img) {
          this.$refs.img.clearFiles();
        }
        if (this.$refs.file) {
          this.$refs.file.clearFiles();
        }
      })
    },
    del(id) {
      this.request.delete("/planItem/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error("请选择需要删除的数据")
        return
      }
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/planItem/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open("http://localhost:9090/planItem/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.item1:nth-child(2n) {
  padding-left: 10px;
}
</style>

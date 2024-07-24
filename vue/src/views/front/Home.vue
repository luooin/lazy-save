<template>
  <div>

    <div style="margin: 10px 0">
      <el-button size="medium" type="primary" @click="handleAdd">新增存钱计划 <i class="el-icon-circle-plus-outline"></i></el-button>
    </div>


    <div style="margin: 20px 0">
      <div v-for="item in tableData" :key="item.id" style="margin-bottom: 10px">
        <div style="border-radius: 10px; padding: 10px; overflow: hidden; border: 1px solid #ccc; display: flex">
          <div style="width: 120px">
            <img :src="item.img" alt="" style="width: 100px; height: 100px">
          </div>
          <div style="flex: 1">
            <div style="margin: 10px; font-size: 20px; cursor: pointer" @click="$router.push('/front/item?id=' + item.id)">{{ item.name }}</div>
            <div style="margin: 10px; color: #666">
              <span>已存入：{{ item.moneyIn }} 元</span>
              <span style="float: right">总金额：<span style="color: orangered">{{ item.total }}</span> 元</span>
            </div>
            <div style="margin: 10px;">
              <el-progress :percentage="parseFloat((item.moneyIn / item.total * 100).toFixed(1))"></el-progress>
            </div>
            <div style="margin: 10px; font-size: 14px; color: #666">{{ item.location }}</div>
            <div style="margin: 10px; font-size: 14px; color: #666">
              <el-button type="text" style="color: red; float: right" @click="del(item.id)">删除</el-button>
            </div>

          </div>
        </div>
      </div>
    </div>

    <div style="padding: 10px 0" v-if="tableData.length">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, prev, pager, next"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="40%" :close-on-click-modal="false">
      <el-form label-width="140px" size="small" style="width: 90%">
        <el-form-item label="计划名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="周期（天）">
          <el-input v-model="form.duration" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="总金额（元）">
          <el-input v-model="form.total" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="每日存入金额（元）">
          <el-input v-model="form.money" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="图片">
          <el-upload action="http://localhost:9090/file/upload" ref="img" :on-success="handleImgUploadSuccess">
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
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
  name: "Plan",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/plan/page/front", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    save() {
      if (!this.form.name || !this.form.total || !this.form.duration ) {
        this.$message.warning("缺少必填参数")
        return
      }
      this.request.post("/plan", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
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
        if(this.$refs.img) {
          this.$refs.img.clearFiles();
        }
        if(this.$refs.file) {
          this.$refs.file.clearFiles();
        }
      })
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
      this.$nextTick(() => {
        if(this.$refs.img) {
          this.$refs.img.clearFiles();
        }
        if(this.$refs.file) {
          this.$refs.file.clearFiles();
        }
      })
    },
    del(id) {
      this.request.delete("/plan/" + id).then(res => {
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
      this.request.post("/plan/del/batch", ids).then(res => {
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
      window.open("http://localhost:9090/plan/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>

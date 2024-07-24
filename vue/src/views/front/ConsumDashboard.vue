<template>
  <div style="margin-bottom: 100px">
    <el-card style="width: 100%; margin-top: 10px">
      <div id="bar" style="width: 100%; height: 400px"></div>
    </el-card>

    <div style="margin-top: 20px">
      <div style="font-size: 24px; color: #1E90FF; margin-bottom: 20px">| 分类消费统计</div>
      <el-card style="border-radius: 10px; margin-bottom: 5px; padding: 10px" v-for="item in all" :key="item.name">
        <div style="font-size: 20px">{{ item.name }}  <span style="color: orangered; margin-left: 20px">￥ {{ item.value }}</span></div>
      </el-card>
    </div>
  </div>
</template>

<script>
import * as echarts from 'echarts';
let  barOption = {
  title: {
    text: '月度消费统计'
  },
  // legend: {
  //   top: 'top'
  // },
  tooltip: {
    trigger: 'axis'
  },
  xAxis: {
    type: 'category',
    data: []
  },
  yAxis: {
    type: 'value'
  },
  series: [{
    name: '消费数',
    data: [],
    type: 'bar',
    itemStyle: {
      normal: {
        //这里是重点
        color: function (params) {
          return "#67C23A"
        }
      }
    }
  }
  ]
};
export default {
  name: "ConsumDashboard",
  data() {
    return {
      all: []
    }
  },
  mounted() {
    var barChart = echarts.init(document.getElementById('bar'));
    this.request.get("/consumption/month").then(res => {
      barOption.xAxis.data = res.data.map(v => v.name)
      barOption.series[0].data = res.data.map(v => v.value)
      barChart.setOption(barOption)
    })

    this.request.get("/consumption/category").then(res => {
      this.all = res.data
    })

  },
  methods: {

  }
}
</script>

<style scoped>

</style>
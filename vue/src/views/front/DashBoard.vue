<template>
  <div style="margin-bottom: 100px">
    <el-card style="width: 100%; margin-top: 10px">
      <div id="bar" style="width: 100%; height: 400px"></div>
    </el-card>

    <el-card style="width: 100%; margin-top: 10px">
      <div id="pie" style="width: 100%; height: 400px"></div>
    </el-card>
  </div>
</template>

<script>
import * as echarts from 'echarts';
let  barOption = {
  title: {
    text: '月度存钱统计'
  },
  legend: {
    top: 'top'
  },
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
    name: '存钱数',
    data: [],
    type: 'bar'
  }
  ]
};
const option = {
  title: {
    text: '存钱计划比例',
    left: 'left'
  },
  legend: {
    top: 'top'
  },
  tooltip: {
    trigger: 'item'
  },
  toolbox: {
    show: true,
    feature: {
      mark: {show: true},
      dataView: {show: true, readOnly: false},
      restore: {show: true},
      saveAsImage: {show: true}
    }
  },
  series: [
    {
      name: '面积模式',
      type: 'pie',
      radius: [50, 150],
      center: ['50%', '60%'],
      label: {
        normal: {
          show: true,
          formatter: '{b}: {c}({d}%)'
        }
      },
      itemStyle: {
        borderRadius: 8
      },
      data: [

      ]
    }
  ]
};

export default {
  name: "DashBoard",
  data() {
    return {

    }
  },
  mounted() {
    var barChart = echarts.init(document.getElementById('bar'));
    var pieChart = echarts.init(document.getElementById('pie'));
    this.request.get("/planItem/month").then(res => {
      barOption.xAxis.data = res.data.map(v => v.name)
      barOption.series[0].data = res.data.map(v => v.value)
      barChart.setOption(barOption)
    })

    this.request.get("/plan/front").then(res => {
      option.series[0].data = []
      res.data.forEach(item => {
        option.series[0].data.push({name: item.name, value: item.total})
      })
      pieChart.setOption(option);
    })
  },
  methods: {

  }
}
</script>

<style scoped>

</style>
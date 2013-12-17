class BonusBatch.Views.Batches.Reports.ShowView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Batches.Reports.ReportView
    @collection.on 'reset', @renderCharts, @
    super

  templatePath: 'batches/reports/show'

  tagName: 'section'

  afterRender: ->
    @width = "#{@$('.panel-body:visible').width()}px"

  renderCharts: ->
    @renderBarsChart()
    @renderPieChart()

  renderBarsChart: ->
    @$('#barsChart').attr width: @width, height: '400px'
    @ctx = @$('#barsChart').get(0).getContext('2d')
    @barsChart = new Chart(@ctx).Bar @collection.barsData()

  renderPieChart: ->
    @$('#pieChart').attr width: @width, height: '400px'
    @ctx = @$('#pieChart').get(0).getContext('2d')
    @barsChart = new Chart(@ctx).Pie @collection.pieData()


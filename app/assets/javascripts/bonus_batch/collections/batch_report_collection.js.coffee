class BonusBatch.Collections.BatchReportCollection extends Backbone.Collection
  initialize: (options) ->
    @batch_id = options.batch_id

  url: ->
    "/batches/#{@batch_id}/bonuses"

  model: BonusBatch.Models.BonusModel

  barsData: ->
    labels : @pluck('name'),
    datasets : [
      {
        fillColor : 'rgba(220,220,220,0.5)',
        strokeColor : 'rgba(220,220,220,1)',
        data : @pluck('amount')
      }
    ]

  pieData: ->
    @map (bonus) ->
      value: bonus.get("amount")
      color: "##{bonus.id}#{bonus.get('receiver_id')}"


require 'test_helper'

class MetricDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metric_detail = metric_details(:one)
  end

  test "should get index" do
    get metric_details_url
    assert_response :success
  end

  test "should get new" do
    get new_metric_detail_url
    assert_response :success
  end

  test "should create metric_detail" do
    assert_difference('MetricDetail.count') do
      post metric_details_url, params: { metric_detail: { driver_id: @metric_detail.driver_id, lat: @metric_detail.lat, lon: @metric_detail.lon, metric_id: @metric_detail.metric_id, timestamp: @metric_detail.timestamp, value: @metric_detail.value } }
    end

    assert_redirected_to metric_detail_url(MetricDetail.last)
  end

  test "should show metric_detail" do
    get metric_detail_url(@metric_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_metric_detail_url(@metric_detail)
    assert_response :success
  end

  test "should update metric_detail" do
    patch metric_detail_url(@metric_detail), params: { metric_detail: { driver_id: @metric_detail.driver_id, lat: @metric_detail.lat, lon: @metric_detail.lon, metric_id: @metric_detail.metric_id, timestamp: @metric_detail.timestamp, value: @metric_detail.value } }
    assert_redirected_to metric_detail_url(@metric_detail)
  end

  test "should destroy metric_detail" do
    assert_difference('MetricDetail.count', -1) do
      delete metric_detail_url(@metric_detail)
    end

    assert_redirected_to metric_details_url
  end
end

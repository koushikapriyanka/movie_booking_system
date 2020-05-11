require 'test_helper'

class ShowDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show_detail = show_details(:one)
  end

  test "should get index" do
    get show_details_url
    assert_response :success
  end

  test "should get new" do
    get new_show_detail_url
    assert_response :success
  end

  test "should create show_detail" do
    assert_difference('ShowDetail.count') do
      post show_details_url, params: { show_detail: { date: @show_detail.date, movie_id: @show_detail.movie_id, theatre_id: @show_detail.theatre_id, ticket_fee: @show_detail.ticket_fee, timing: @show_detail.timing } }
    end

    assert_redirected_to show_detail_url(ShowDetail.last)
  end

  test "should show show_detail" do
    get show_detail_url(@show_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_show_detail_url(@show_detail)
    assert_response :success
  end

  test "should update show_detail" do
    patch show_detail_url(@show_detail), params: { show_detail: { date: @show_detail.date, movie_id: @show_detail.movie_id, theatre_id: @show_detail.theatre_id, ticket_fee: @show_detail.ticket_fee, timing: @show_detail.timing } }
    assert_redirected_to show_detail_url(@show_detail)
  end

  test "should destroy show_detail" do
    assert_difference('ShowDetail.count', -1) do
      delete show_detail_url(@show_detail)
    end

    assert_redirected_to show_details_url
  end
end

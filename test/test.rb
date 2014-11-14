require 'minitest/autorun'
require_relative '../url_splitter'

class URLSplitterTest < Minitest::Test
  def valid_url
    URLSplitter.new 'http://www.google.se/a-path'
  end

  def invalid_url
    URLSplitter.new 'www.google.se'
  end

  def test_instantiate_url_splitter
    us = valid_url
    assert us.instance_of? URLSplitter
  end

  def test_protocol
    us = valid_url
    assert us.protocol == 'http'
  end

  def test_url_withouth_protocol_returns_nil
    us = invalid_url
    assert us.protocol.nil?
  end

  def test_url_with_protocol_is_valid
    us = valid_url
    assert us.valid?
  end

  def test_url_withouth_procotol
    us = invalid_url
    assert !us.valid?
  end

  def test_domain
    us = valid_url
    assert us.domain == 'www.google.se'
  end

  def test_domain_with_invalid_url
    us = invalid_url
    assert us.domain.nil?
  end

  def test_url_with_domain_is_valid
    us = valid_url
    assert us.valid?
  end

  def test_url_without_domain_is_invalid
    us = invalid_url
    assert !us.valid?
  end

  def test_path
    us = valid_url
    assert us.path == 'a-path'
  end

  def test_empty_path
    us = URLSplitter.new 'http://www.google.se'
    assert us.path.empty?
  end

  def test_complex_path
    us = URLSplitter.new 'http://www.google.se/a-path/complex'
    assert us.path == 'a-path/complex'
  end

  def test_weird_url
    us = URLSplitter.new 'http:///a-path'
    assert !us.valid?
  end
end


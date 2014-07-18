class Pipeline < ActiveRecord::Base
  include PipelinePagesExt

  attr_accessible :locale, :status, :serial, :group, :main
  attr_accessible :country, :country_id, :product, :product_id

  belongs_to :country
  belongs_to :product

  has_many :pipeline_pages, dependent: :destroy
  has_many :pages, through: :pipeline_pages
  
  validates :group, presence: true


  def self.locate domain: domain, country: country, locale: locale 
    pipeline = Pipeline.locate_matching_parameters domain: domain, country: country, locale: locale, main: true
    pipeline = Pipeline.locate_matching_parameters domain: domain, country: country, locale: locale, main: false unless pipeline.present?
    pipeline = Pipeline.locate_matching_parameters domain: domain, country: country, main: true unless pipeline.present?
    pipeline = Pipeline.locate_matching_parameters domain: domain, country: country, main: false unless pipeline.present?
    pipeline = Pipeline.locate_matching_parameters domain: domain unless pipeline.present?

    return pipeline
  end

  def self.locate_matching_parameters domain: domain, country: nil, locale: nil, main: true
    group = self.find_pipeline_group domain

    if country.present?
      if locale.present?
        pipeline = Pipeline.find_by({main: main, country: country, locale: locale, group: group})
        pipeline = Pipeline.find_by({main: main, country: country, locale: locale}) unless pipeline.present?
      else
        pipeline = Pipeline.find_by({main: main, country: country, group: group})
        pipeline = Pipeline.find_by({main: main, country: country}) unless pipeline.present?
      end
    else
      if locale.present?
        pipeline = Pipeline.find_by({main: main, group: group})
        pipeline = Pipeline.find_by({main: main}) unless pipeline.present?
      else
        pipeline = Pipeline.find_by({main: main, group: group})
        pipeline = Pipeline.find_by({main: main}) unless pipeline.present?
      end
    end

    return pipeline
  end

  private
    def self.find_pipeline_group domain
      return "norden" unless domain.present?
      if domain.include? "swiss"
        return "swiss"
      elsif domain.include? "norden"
        return "norden"
      elsif domain.include? "stockholm"
        return "norden"
      else
        return "norden"
      end
    end

end
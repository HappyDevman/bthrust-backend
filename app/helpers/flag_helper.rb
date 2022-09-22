# frozen_string_literal: true

module FlagHelper
  mattr_accessor :flags_map, instance_writer: false
  self.flags_map = {
    'af' => 'za', 'sq' => 'al', 'am' => 'et', 'ar' => 'aa', 'hy' => 'am', 'az' => 'az', 'be' => 'by', 'bn' => 'bd',
    'bs' => 'ba', 'bg' => 'bg', 'ca' => 'ad', 'zh' => 'cn', 'co' => 'co', 'hr' => 'hr', 'cs' => 'cz', 'da' => 'dk',
    'nl' => 'nl', 'en' => 'gb', 'eo' => 'eo', 'et' => 'ee', 'eu' => 'eu', 'fi' => 'fi', 'fr' => 'fr', 'gl' => 'gl',
    'ka' => 'ge', 'de' => 'de', 'el' => 'gr', 'gu' => 'in', 'ht' => 'ht', 'ha' => 'ha', 'haw' => 'haw', 'he' => 'il',
    'hi' => 'in', 'hu' => 'hu', 'is' => 'is', 'ig' => 'ng', 'id' => 'id', 'ga' => 'ie', 'it' => 'it', 'ja' => 'jp',
    'kk' => 'kz', 'km' => 'kh', 'rw' => 'rw', 'ko' => 'kr', 'ku' => 'iq', 'ky' => 'kg', 'lo' => 'la', 'la' => 'va',
    'lv' => 'lv', 'lt' => 'lt', 'lb' => 'lu', 'mk' => 'mk', 'mg' => 'mg', 'ms' => 'my', 'mt' => 'mt', 'mi' => 'nz',
    'mn' => 'mn', 'my' => 'my', 'ne' => 'np', 'no' => 'no', 'nb' => 'no', 'ny' => 'mw', 'ps' => 'af', 'fa' => 'ir',
    'pl' => 'pl', 'pt' => 'pt', 'pa' => 'in', 'ro' => 'ro', 'ru' => 'ru', 'sm' => 'sm', 'gd' => 'gd', 'sr' => 'rs',
    'st' => 'ls', 'sn' => 'zw', 'si' => 'lk', 'sk' => 'sk', 'sl' => 'si', 'so' => 'so', 'es' => 'es', 'sv' => 'se',
    'tl' => 'ph', 'tg' => 'tj', 'ta' => 'lk', 'te' => 'in', 'th' => 'th', 'tr' => 'tr', 'tk' => 'tm', 'uk' => 'ua',
    'ur' => 'pk', 'uz' => 'uz', 'vi' => 'vn', 'cy' => 'cy', 'xh' => 'za', 'zu' => 'za'
  }.freeze

  def language_to_flag_code(code)
    flags_map.fetch(code, 'fallback')
  end
end

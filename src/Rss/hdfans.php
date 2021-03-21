<?php
/**
 * hdfans RSS解码类
 */
namespace IYUU\Rss;

class hdfans extends AbstractRss
{
    /**
     * 站点标志
     * @var string
     */
    public $site = 'hdfans';

    /**
     * 抽象方法，在类中实现
     * 解码html为种子数组
     * @param string    $html
     * @return array
     */
    public function decode($html = '')
    {
        echo "正在解码RSS资源...". PHP_EOL;
        return $this->NexusPHP($html);
    }
}

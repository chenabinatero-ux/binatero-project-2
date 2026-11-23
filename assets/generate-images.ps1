Add-Type -AssemblyName System.Drawing

$dir = "C:\xampp\htdocs\Binatero-project-2\assets\images"
$navy1 = [System.Drawing.Color]::FromArgb(10, 31, 68)
$navy2 = [System.Drawing.Color]::FromArgb(20, 58, 107)
$gold  = [System.Drawing.Color]::FromArgb(201, 162, 39)
$white = [System.Drawing.Color]::White

function New-Placeholder {
    param([int]$w, [int]$h, [string]$path, [string]$label1, [string]$label2, [bool]$isLogo = $false)

    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = 'AntiAlias'

    # diagonal gradient
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Rectangle(0,0,$w,$h)), $navy1, $navy2, 35)
    $g.FillRectangle($brush, 0, 0, $w, $h)

    if ($isLogo) {
        # gold double ring
        $pen = New-Object System.Drawing.Pen($gold, 10)
        $g.DrawEllipse($pen, 36, 36, $w-72, $h-72)
        $pen2 = New-Object System.Drawing.Pen($gold, 3)
        $g.DrawEllipse($pen2, 66, 66, $w-132, $h-132)
        # cross
        $cp = New-Object System.Drawing.Pen($white, 14)
        $cx = $w/2; $cy = $h/2
        $g.DrawLine($cp, $cx, $cy-90, $cx, $cy+90)
        $g.DrawLine($cp, $cx-55, $cy-35, $cx+55, $cy-35)
    } else {
        # decorative gold bars
        $bar = New-Object System.Drawing.SolidBrush($gold)
        $g.FillRectangle($bar, 0, $h-14, $w, 14)
        $g.FillRectangle($bar, 0, 0, [int]($w*0.35), 10)
        # simple skyline shapes
        $sky = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(60, 90, 140, 190))
        $bw = [int]($w/18)
        for ($i=0; $i -lt 10; $i++) {
            $bx = [int]($w*0.06 + $i*($bw+18))
            $bh = [int]($h*(0.12 + (($i*37) % 10)/28))
            $g.FillRectangle($sky, $bx, $h-14-$bh, $bw, $bh)
            # windows
            $win = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(201,162,39))
            for ($r=0; $r -lt 3; $r++) {
                for ($c=0; $c -lt 2; $c++) {
                    if (($i+$r+$c) % 2 -eq 0) {
                        $g.FillRectangle($win, $bx+8+$c*($bw/2-4), $h-14-$bh+14+$r*22, 10, 12)
                    }
                }
            }
        }
    }

    # text
    $font1 = New-Object System.Drawing.Font("Segoe UI", $(if($isLogo){30}else{44}), [System.Drawing.FontStyle]::Bold)
    $font2 = New-Object System.Drawing.Font("Segoe UI", $(if($isLogo){16}else{22}), [System.Drawing.FontStyle]::Regular)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = 'Center'; $sf.LineAlignment = 'Center'
    $rect = New-Object System.Drawing.RectangleF(0, [int]($h*0.62), $w, [int]($h*0.3))
    $g.DrawString($label1, $font1, (New-Object System.Drawing.SolidBrush($white)), $rect, $sf)
    if ($label2) {
        $rect2 = New-Object System.Drawing.RectangleF(0, [int]($h*0.78), $w, [int]($h*0.18))
        $g.DrawString($label2, $font2, (New-Object System.Drawing.SolidBrush($gold)), $rect2, $sf)
    }

    if ($path -like "*.png") { $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png) }
    else { $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Jpeg) }
    $g.Dispose(); $bmp.Dispose()
    Write-Output "created $path"
}

New-Placeholder 512 512 "$dir\school-logo.png" "KCC" "Kabankalan Catholic College" $true
New-Placeholder 1600 900 "$dir\campus.jpg" "Kabankalan Catholic College" "Our Campus"
New-Placeholder 1200 800 "$dir\students.jpg" "Student Life" "Growing Together"
New-Placeholder 1200 800 "$dir\academics.jpg" "Academics" "Programs of Excellence"
New-Placeholder 1200 800 "$dir\admissions.jpg" "Admissions" "Begin Your Journey"
New-Placeholder 1200 800 "$dir\campus-life.jpg" "Campus Life" "Beyond the Classroom"
New-Placeholder 1200 675 "$dir\news-enrollment.jpg" "Enrollment" "Now Open"
New-Placeholder 1200 675 "$dir\news-event.jpg" "School Events" "Mark Your Calendar"
New-Placeholder 1200 675 "$dir\news-activities.jpg" "Student Activities" "Get Involved"

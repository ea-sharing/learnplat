<?php
require_once 'vendor/autoload.php'; // Include Composer's autoloader
require_once 'libs/config.php'; // Include database configuration

use Aws\S3\S3Client;
use Aws\Exception\AwsException;


// Function to generate certificate PDF for a user
function generateCertificate($userId, $username, $courseName) {
    // Create a temporary folder if it doesn't exist
    $tempFolder = '/var/www/html/tmppdf';
    if (!file_exists($tempFolder)) {
        mkdir($tempFolder, 0777, true);
    }
    $courseN = preg_replace('/\s+/', '', $courseName);
    
    // Create unique filename for the PDF using username and user ID
    $filename = $tempFolder . '/' . $username . '_' . $userId . '_' . $courseN . '_certificate.pdf';

    // Create new TCPDF instance
    $pdf = new TCPDF('A3', 'mm', array(197, 160), true, 'UTF-8', false);
    $pdf->SetMargins(15, 15, 15); // Set margins (left, top, right)
    $pdf->SetFillColor(255, 255, 255); // Set RGB color (white)
    $pdf->SetAutoPageBreak(false); // Disable automatic page break
    $pdf->AddPage();
    $pdf->SetFont('helvetica', '', 12);
    // Add content to the PDF
    $pdf->Cell(0, 10, 'Certificate of Completion', 0, 1, 'C');
    $pdf->Ln(10);
    $pdf->Cell(0, 10, 'This is to certify that', 0, 1, 'C');
    $pdf->Ln(10);
    $pdf->Cell(0, 10, ' ' . $username, 0, 1, 'C');
    $pdf->Ln(10);
    $pdf->Cell(0, 10, 'has successfully completed the course "' . $courseName . '" on ' . date('Y-m-d'), 0, 1, 'C');
    $pdf->Ln(20);
    $signatureX = ($pdf->GetPageWidth() - 30) / 2; // Center horizontally
    $signatureY = $pdf->GetY(); // Get current Y position
    $pdf->Image('images/sign.jpeg', $signatureX, $signatureY, 30, 10); // Adjust image path and size as needed
    $pdf->Ln(20);
    $pdf->Cell(0, 5, 'Interactive Online Learning Platform', 0, 1, 'C');
    $pdf->endPage();
    $pdf->Output($filename, 'F');

    return $filename;
}

// Function to upload PDF to Amazon S3
function uploadToS3($filePath, $keyName) {
    $s3Client = new S3Client([
        'region' => AWS_REGION,
        'version' => AWS_VERSION,
        'credentials' => [
            'key' => AWS_ACCESS_KEY,
            'secret' => AWS_SECRET_KEY,
        ],
    ]);

    try {
        // Upload the PDF to S3 bucket
        $result = $s3Client->putObject([
            'Bucket' => AWS_BUCKET,
            'Key' => $keyName,
            'SourceFile' => $filePath,
        ]);

        return $result['ObjectURL']; // Return the URL of the uploaded file
    } catch (AwsException $e) {
        return false; // Return false if upload fails
    }
}

?>

